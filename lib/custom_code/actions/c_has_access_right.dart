// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:async';

Future<String> cHasAccessRight(
  String clientId,
  String clientSecret,
) async {
  // Add your function code here!

  print('cHasAccessRight Start');
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);

  final completer =
      Completer<String>(); // Use Completer to handle async operation

  channel.sink.add(
      '{ "id": 2, "jsonrpc": "2.0", "method": "hasAccessRightRightRٌ", "params": { "clientId": "$clientId", "clientSecret": "$clientSecret" } }');
  channel.stream.listen(
    (message) {
      print('Received message: $message');
      completer
          .complete(message); // Complete the Future with the received message
      channel.sink.close(status.goingAway);
    },
    onDone: () {
      print('WebSocket closed');
    },
    onError: (error) {
      print('Error: $error');
      completer.completeError(
          error); // Complete the Future with an error if encountered
    },
  );

  print('cHasAccessRight before await');
  await completer.future; // Wait for the Future to be completed
  print('cHasAccessRight after await');

  return completer.future;
}
