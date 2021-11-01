// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// import 'dart:convert';

// void main(List<String> arguments) {
//   final channel = IOWebSocketChannel.connect('wss://ws.binaryws.com/websockets/v3?app_id=1089');

//   channel.stream.listen((message) {
//     final decodedMessage = jsonDecode(message);
//     final serverTimeAsEpoch = decodedMessage['time'];
//     final serverTime = DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
//     print(serverTime);
//     // To disconnect from the websocket use : channel.sink.close();
//   });

//   channel.sink.add('{"time": 1}');
// }

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';

void main(List<String> arguments) {
  final channel = IOWebSocketChannel.connect('wss://ws.binaryws.com/websockets/v3?app_id=1089');

  channel.stream.listen((active) {
    final decodedMessage = jsonDecode(active);
    final active_symbols = decodedMessage['ticks']['quotes']['epoch'];
    print(active_symbols);
    // To disconnect from the websocket use : channel.sink.close();
  });

  channel.sink.add('{"ticks": "R_50","subscribe": 1}');
}