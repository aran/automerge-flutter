import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> args) async {
  var parser = ArgParser();
  parser.addOption('port', abbr: 'p', defaultsTo: '8000');
  parser.addOption('web-port', abbr: 'w', defaultsTo: '8080');

  var results = parser.parse(args.takeWhile((arg) => arg != '--').toList());
  var port = int.parse(results['port'] as String);
  var flutterPort = int.parse(results['web-port'] as String);
  var remainingArgs = args.skipWhile((arg) => arg != '--').skip(1).toList();

  var process = await Process.start(
    'flutter',
    [
      'run',
      '-d',
      'chrome',
      '--web-port',
      flutterPort.toString(),
      ...remainingArgs
    ],
  );

  // Relay stdin, stdout and stderr from the flutter process.
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  process.stdin.addStream(stdin);

  var handler = const Pipeline().addHandler((Request request) async {
    var proxyRequest = http.Request(request.method,
        Uri.parse('http://localhost:$flutterPort${request.requestedUri.path}'));
    proxyRequest.headers.addAll(request.headers);
    var proxyResponse = await http.Client().send(proxyRequest);

    var headers = proxyResponse.headers
      ..addAll(
        {
          'Access-Control-Allow-Origin': '*',
          'Cross-Origin-Embedder-Policy': 'require-corp',
          'Cross-Origin-Opener-Policy': 'same-origin',
        },
      );

    return Response(
      proxyResponse.statusCode,
      body: proxyResponse.stream,
      headers: headers,
    );
  });

  await shelf_io.serve(handler, InternetAddress.loopbackIPv6, port);
}
