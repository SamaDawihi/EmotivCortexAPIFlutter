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

List<String> availableHeadsetId(String json) {
  // return all id {"result":[{"id":"EPOCX-E50207C0","status":"connected"},{"id":"EPOCX-E58207C0"}]}
  final Map<String, dynamic> data = jsonDecode(json);
  final List<dynamic> result = data['result'];
  final List<String> ids = [];
  for (final item in result) {
    ids.add(item['id']);
  }
  return ids;
}
