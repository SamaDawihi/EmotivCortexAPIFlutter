import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

dynamic stringToJson(String text) {
  // coverts string to Json object
  return jsonDecode(text);
}

bool getIsUserLogedIn(String json) {
  // return all id {"result":[{"id":"EPOCX-E50207C0","status":"connected"},{"id":"EPOCX-E58207C0"}]}
  final Map<String, dynamic> data = jsonDecode(json);
  final List<dynamic> result = data['result'];
  return result.isNotEmpty;
}

String getSessionId(String json) {
  // return all id {"id":3,"jsonrpc":"2.0","result":{"accessGranted":true,"message":"The access right to the application has already been granted."}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['id'];
}

bool getEmotivIsInstalled(String json) {
  try {
    final Map<String, dynamic> data = jsonDecode(json);

    // Check if "result" key is present
    if (data.containsKey('result')) {
      final dynamic result = data['result'];

      // Check for the required keys to determine if Emotiv is installed
      if (result is Map<String, dynamic> &&
          result.containsKey('buildDate') &&
          result.containsKey('buildNumber') &&
          result.containsKey('version')) {
        print(
            'Emotiv is installed. Build Date: ${result['buildDate']}, Build Number: ${result['buildNumber']}, Version: ${result['version']}');
        return true; // Emotiv is installed
      } else {
        print('Emotiv is not installed. Missing keys in result.');
        return false; // Emotiv is not installed, keys are missing
      }
    } else {
      print('Emotiv is not installed. "result" key is missing.');
      return false; // "result" key is missing
    }
  } catch (e) {
    print('Error occurred. Emotiv is not installed.');
    return false; // Error occurred, indicating Emotiv is not installed
  }
}

String getCortexToken(String json) {
  // return all id {"id":3,"jsonrpc":"2.0","result":{"accessGranted":true,"message":"The access right to the application has already been granted."}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['cortexToken'];
}

List<String> getAvailableHeadsetId(String json) {
  // return all id {"result":[{"id":"EPOCX-E50207C0","status":"connected"},{"id":"EPOCX-E58207C0"}]}
  final Map<String, dynamic> data = jsonDecode(json);
  final List<dynamic> result = data['result'];
  final List<String> ids = [];
  for (final item in result) {
    ids.add(item['id']);
  }
  return ids;
}

bool getHasAccessRight(String json) {
  // return all id {"id":3,"jsonrpc":"2.0","result":{"accessGranted":true,"message":"The access right to the application has already been granted."}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['accessGranted'];
}
