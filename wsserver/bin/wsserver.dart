import 'package:wsserver/wsserver.dart' as wsserver;

void main(List<String> arguments) async {
  var wsServer = wsserver.WebSocketServer();
  await wsServer.start('localhost', 7000);
}
