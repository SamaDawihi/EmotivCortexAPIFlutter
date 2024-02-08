// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

Future<String> aGetCortexInfo() async {
  // Add your function code here!
  print('aGetCortexInfo Start');
  var output = '';
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);
  await channel.ready;
  channel.stream.listen((message) {
    channel.sink.add('{"id":1,"jsonrpc":"2.0","method":"getCortexInfo"}');
    print('Received message: $message');
    print('aGetCortexInfo before output = message');
    output = message;
    channel.sink.close(status.goingAway);
  });
  print('aGetCortexInfo before return output');
  return output;
}
