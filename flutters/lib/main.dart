import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Contact contact = const Contact(
      name: '', address: Address(lineOne: '', city: '', postcode: ''));
  late Future<MutexAutoCommit> contactDoc;
  late final WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();

    contactDoc = newContactDoc(contact);

    _channel = WebSocketChannel.connect(Uri.parse('ws://[::1]:7000/'));

    _channel.stream.listen((message) {
      if (message is List<int>) {
        var buffer = Uint8List.fromList(message);
        var type = buffer[0];
        var payload = buffer.sublist(1);

        switch (type) {
          case 0: // reset
            contactDoc.then((cd) async {
              await resetContact(payload);
            });
            break;
          case 1: // update
            contactDoc.then((cd) async {
              await receiveContact(payload);
            });

            break;
          default:
            print('Unknown message type: $type');
            break;
        }
      }
    }, onError: (error) {
      print(error);
    });

    contactDoc.then((cd) async {
      Uint8List bytes = await api.saveDoc(mdoc: cd);
      _broadcastReset(bytes);
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendMessage(int type, Uint8List payload) {
    var buffer = Uint8List(payload.length + 1);
    buffer[0] = type;
    buffer.setRange(1, buffer.length, payload);
    _channel.sink.add(buffer);
  }

  void _broadcastReset(Uint8List payload) {
    _sendMessage(0, payload); // Let's say type 0 means reset
  }

  void _broadcastUpdate(Uint8List payload) {
    _sendMessage(1, payload); // And type 1 means update
  }

  Future<MutexAutoCommit> newContactDoc(Contact c) async {
    MutexAutoCommit mdoc = await api.newDoc();
    MutexAutoCommit mc = await api.reconcileContact(mdoc: mdoc, contact: c);
    return mc;
  }

  Future<Uint8List> updateContact(Contact c) async {
    contactDoc = api.reconcileContact(mdoc: await contactDoc, contact: c);
    setState(() {
      contact = c;
    });

    return await api.saveDoc(mdoc: await contactDoc);
  }

  Future<void> resetContact(Uint8List bytes) async {
    contactDoc = api.loadDoc(bytes: bytes);
    Contact c = await api.hydrateContact(mdoc: await contactDoc);
    setState(() {
      contact = c;
    });
  }

  Future<void> receiveContact(Uint8List bytes) async {
    var [cd, recv] = await Future.wait([contactDoc, api.loadDoc(bytes: bytes)]);
    contactDoc = api.mergeDoc(mdoc1: cd, mdoc2: recv);

    Contact c = await api.hydrateContact(mdoc: await contactDoc);
    setState(() {
      contact = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contact',
            ),
            Text(
              contact.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              contact.address.lineOne,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              contact.address.city,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              contact.address.postcode,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () async {
                var bytes = await updateContact(const Contact(
                    name: 'John Doe',
                    address: Address(
                        lineOne: '123 Main Street',
                        city: 'London',
                        postcode: 'SW1 1AA')));
                _broadcastUpdate(bytes);
              },
              child: const Text('Update to John'),
            ),
            TextButton(
              onPressed: () async {
                var bytes = await updateContact(const Contact(
                    name: 'Jane Doe',
                    address: Address(
                        lineOne: '456 Main Street',
                        city: 'London',
                        postcode: 'SW1 1AA')));
                _broadcastUpdate(bytes);
              },
              child: const Text('Update to Jane'),
            ),
          ],
        ),
      ),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  GreetingWidget({super.key});

  final Future<String> greeting = api.greet();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: greeting,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class SumWidget extends StatelessWidget {
  SumWidget({super.key});

  final Future<int> sum = api.add(a: 2, b: 2);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: sum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('2 + 2 = ${snapshot.data}');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
