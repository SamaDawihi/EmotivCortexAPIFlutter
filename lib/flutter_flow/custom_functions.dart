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

bool getLicenseHasEEG(String json) {
  // return scope contains eeg {"id":2,"jsonrpc":"2.0","result":{"isOnline":true,"license":{"applications":["com.emotiv.sdk.eeg"],"billingFrom":"2024-01-31T03:00:00.000+03:00","billingTo":"2025-01-31T03:00:00.000+03:00","deviceInfo":{"deviceLimit":1,"devicesPerSeat":1,"sessionLimit":{"day":null,"month":null,"year":null}},"expired":false,"extenderLimit":0,"hardLimitTime":"2024-03-13T03:00:00.000+03:00","isCommercial":false,"licenseId":"2b5898f3-8c56-46f9-a835-11cb89927f85","licenseName":"Cortex API","localQuota":7,"maxDebit":null,"nameCode":"","scopes":["eeg"],"seatCount":1,"sessionCount":0,"softLimitTime":"2024-03-06T03:00:00.000+03:00","totalDebit":9,"totalRegisteredDevices":1,"validFrom":"2024-02-05T03:00:00.000+03:00","validTo":"2025-02-07T02:59:59.999+03:00"}}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['license']['scopes'].contains("eeg");
}

bool getHasAccessRight(String json) {
  // return all id {"id":3,"jsonrpc":"2.0","result":{"accessGranted":true,"message":"The access right to the application has already been granted."}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['accessGranted'];
}
