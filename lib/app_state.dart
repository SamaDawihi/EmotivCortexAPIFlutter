import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    _safeInit(() {
      _emotions = prefs.getStringList('ff_emotions') ?? _emotions;
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

  List<String> _emotions = ['Happy', 'Angry', 'Natural', 'Sad', 'Relaxed'];
  List<String> get emotions => _emotions;
  set emotions(List<String> value) {
    _emotions = value;
    prefs.setStringList('ff_emotions', value);
  }

  void addToEmotions(String value) {
    _emotions.add(value);
    prefs.setStringList('ff_emotions', _emotions);
  }

  void removeFromEmotions(String value) {
    _emotions.remove(value);
    prefs.setStringList('ff_emotions', _emotions);
  }

  void removeAtIndexFromEmotions(int index) {
    _emotions.removeAt(index);
    prefs.setStringList('ff_emotions', _emotions);
  }

  void updateEmotionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _emotions[index] = updateFn(_emotions[index]);
    prefs.setStringList('ff_emotions', _emotions);
  }

  void insertAtIndexInEmotions(int index, String value) {
    _emotions.insert(index, value);
    prefs.setStringList('ff_emotions', _emotions);
  }

  DisabledProfileStruct _disabledProfile =
      DisabledProfileStruct.fromSerializableMap(jsonDecode(
          '{"name":"Saleh","age":"60","ethnicity":"arabic","gender":"male","skincolor":"medium","haircolor":"gray","eyecolor":"black","facialhair":"Clean-Shaven"}'));
  DisabledProfileStruct get disabledProfile => _disabledProfile;
  set disabledProfile(DisabledProfileStruct value) {
    _disabledProfile = value;
  }

  void updateDisabledProfileStruct(Function(DisabledProfileStruct) updateFn) {
    updateFn(_disabledProfile);
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
