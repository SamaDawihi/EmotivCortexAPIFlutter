// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
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

Future<String> gSubscribe(String cortexToken, String headsetId) async {
  // Add your function code here!
  print('gSubscribe: Create session start');
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);

  final completer = Completer<String>();
  final List<String> responses = [];
  String sessionId = '';
  bool reachedZero = false;
  //EegStruct eeg = EegStruct();

  try {
    // CREATE SESSION
    channel.sink.add('''
      {
        "id": 9,
        "jsonrpc": "2.0",
        "method": "createSession",
        "params": {
          "cortexToken": "$cortexToken",
          "headset": "$headsetId",
          "status": "active"
        }
      }
    ''');

    // SUBSCRIBE
    print('gSubscribe: Subscribe start');

    // Forward messages from subscribeChannel to the new stream
    channel.stream.listen((message) {
      if (sessionId.isEmpty) {
        sessionId = getSessionId(message);
        print(message);
        channel.sink.add('''
          {
            "id": 10,
            "jsonrpc": "2.0",
            "method": "subscribe",
            "params": {
              "cortexToken": "$cortexToken",
              "session": "$sessionId",
              "streams": ["eeg"]
            }
          }
        ''');
      } else {
        print('gSubscribe: $reachedZero Received message: $message');
        final Map<String, dynamic> json = jsonDecode(message);
        if (json.containsKey("eeg")) {
          print('json[eeg][0]: ${json["eeg"][0]}');
          if (!reachedZero && json["eeg"][0] == 0) reachedZero = true;
          if (reachedZero) responses.add(message);
          print("responses.length: ${responses.length}");
          if (responses.length >= 128) {
            print("responses.first: ${responses.first}");
            print("responses.last: ${responses.last}");
            print(
                'gSubscribe: Reached 128 records. Closing WebSocket channel.');
            channel.sink.close(status.goingAway);
          }
        }
      }
    });
    completer.complete(responses.join('\n'));
  } catch (error) {
    print('gSubscribe: Error occurred: $error');
    completer.completeError(error);
  }

  return completer.future;
}
