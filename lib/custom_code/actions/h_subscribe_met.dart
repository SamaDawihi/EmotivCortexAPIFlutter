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

Future<MetStruct> hSubscribeMet(String cortexToken, String headsetId) async {
  // Add your function code here!
  print('hSubscribeMet: Create session start');
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);

  final completer = Completer<MetStruct>();
  String sessionId = '';
  MetStruct met = MetStruct();

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
  print('hSubscribeMet: Subscribe start');

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
              "streams": ["met"]
            }
          }
        ''');
    } else {
      //"attention.isActive",1"attention",2"eng.isActive",3"eng",4"exc.isActive",5"exc",6"lex",7"str.isActive",8"str",9"rel.isActive",
      //10"rel",11"int.isActive",12"int"
      print('hSubscribeMet: Received message: $message');
      final Map<String, dynamic> json = jsonDecode(message);
      if (json.containsKey("met")) {
        met.attention = json[met][1] >= 0.5;
        met.engagement = json[met][3] >= 0.5;
        met.excitement = json[met][5] >= 0.5;
        met.stress = json[met][8] >= 0.5;
        met.relaxation = json[met][10] >= 0.5;
        met.interest = json[met][12] >= 0.5;
        completer.complete(met);
      }
    }
  });
  return await completer.future;
}
