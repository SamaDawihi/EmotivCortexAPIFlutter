import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _clientId = prefs.getString('ff_clientId') ?? _clientId;
    });
    _safeInit(() {
      _clientSecret = prefs.getString('ff_clientSecret') ?? _clientSecret;
    });
    _safeInit(() {
      _defaultHeadset = prefs.getString('ff_defaultHeadset') ?? _defaultHeadset;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _clientId = 'CkXnClNZKVdp00AN3EsXWwXtWhocR57vkG46NEx0';
  String get clientId => _clientId;
  set clientId(String value) {
    _clientId = value;
    prefs.setString('ff_clientId', value);
  }

  String _clientSecret =
      'uNvvXqglXVktp3nlzN7zNjLragEktCBYRoLVQWfrF0mkC1l3c3Lbnc91gdjRpfgl6tX0VpMKVFq6Q7dknHN4McGxFLu99kLGIy9Mi61R9mGQfK4Nshqbc1M3JjwXoP3W';
  String get clientSecret => _clientSecret;
  set clientSecret(String value) {
    _clientSecret = value;
    prefs.setString('ff_clientSecret', value);
  }

  String _defaultHeadset = '';
  String get defaultHeadset => _defaultHeadset;
  set defaultHeadset(String value) {
    _defaultHeadset = value;
    prefs.setString('ff_defaultHeadset', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
