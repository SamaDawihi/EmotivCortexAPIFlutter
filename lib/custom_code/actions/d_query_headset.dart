// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:async';

Future<String> dQueryHeadset() async {
  // Add your function code here!

  print('dQueryHeadset Start');
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);

  final completer =
      Completer<String>(); // Use Completer to handle async operation

  channel.sink.add(
      '{ "id": 4, "jsonrpc": "2.0", "method": "queryHeadsets", "params": { "id": "EPOC-*" } }');
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

  print('dQueryHeadset before await');
  await completer.future; // Wait for the Future to be completed
  print('dQueryHeadset after await');

  return completer.future;
}
