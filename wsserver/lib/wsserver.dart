import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketServer {
  late HttpServer _server;
  final List<WebSocketChannel> _clients = [];

  Future<void> start(String address, int port) async {
    _server = await HttpServer.bind(address, port);
    print(
        "WebSocket server has been started at ${_server.address.address}:${_server.port}");

    // _server.transform(WebSocketTransformer()).listen((WebSocket webSocket) {
    //   var channel = IOWebSocketChannel(webSocket);
    //   _clients.add(channel);
    //   _handleWebSocket(channel);
    // });

    _server.listen((HttpRequest req) async {
      WebSocket socket = await WebSocketTransformer.upgrade(req);
      var channel = IOWebSocketChannel(socket);
      _clients.add(channel);
      _handleWebSocket(channel);
    });
  }

  void _handleWebSocket(WebSocketChannel clientChannel) {
    print('New client connected');
    clientChannel.stream.listen((message) {
      print('Received: $message');
      // Broadcast received message to all connected clients
      for (var client in _clients) {
        if (client != clientChannel) {
          // Prevent echo to sending client
          client.sink.add(message);
        }
      }
    }, onDone: () {
      _clients.remove(clientChannel);
    });
  }
}
