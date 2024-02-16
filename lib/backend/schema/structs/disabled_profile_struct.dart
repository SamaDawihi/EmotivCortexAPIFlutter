// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisabledProfileStruct extends BaseStruct {
  DisabledProfileStruct({
    String? name,
    int? age,
    String? ethnicity,
    String? gender,
    String? skincolor,
    String? haircolor,
    String? eyecolor,
    String? facialhair,
  })  : _name = name,
        _age = age,
        _ethnicity = ethnicity,
        _gender = gender,
        _skincolor = skincolor,
        _haircolor = haircolor,
        _eyecolor = eyecolor,
        _facialhair = facialhair;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "ethnicity" field.
  String? _ethnicity;
  String get ethnicity => _ethnicity ?? '';
  set ethnicity(String? val) => _ethnicity = val;
  bool hasEthnicity() => _ethnicity != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "skincolor" field.
  String? _skincolor;
  String get skincolor => _skincolor ?? '';
  set skincolor(String? val) => _skincolor = val;
  bool hasSkincolor() => _skincolor != null;

  // "haircolor" field.
  String? _haircolor;
  String get haircolor => _haircolor ?? '';
  set haircolor(String? val) => _haircolor = val;
  bool hasHaircolor() => _haircolor != null;

  // "eyecolor" field.
  String? _eyecolor;
  String get eyecolor => _eyecolor ?? '';
  set eyecolor(String? val) => _eyecolor = val;
  bool hasEyecolor() => _eyecolor != null;

  // "facialhair" field.
  String? _facialhair;
  String get facialhair => _facialhair ?? '';
  set facialhair(String? val) => _facialhair = val;
  bool hasFacialhair() => _facialhair != null;

  static DisabledProfileStruct fromMap(Map<String, dynamic> data) =>
      DisabledProfileStruct(
        name: data['name'] as String?,
        age: castToType<int>(data['age']),
        ethnicity: data['ethnicity'] as String?,
        gender: data['gender'] as String?,
        skincolor: data['skincolor'] as String?,
        haircolor: data['haircolor'] as String?,
        eyecolor: data['eyecolor'] as String?,
        facialhair: data['facialhair'] as String?,
      );

  static DisabledProfileStruct? maybeFromMap(dynamic data) => data is Map
      ? DisabledProfileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'age': _age,
        'ethnicity': _ethnicity,
        'gender': _gender,
        'skincolor': _skincolor,
        'haircolor': _haircolor,
        'eyecolor': _eyecolor,
        'facialhair': _facialhair,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'ethnicity': serializeParam(
          _ethnicity,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'skincolor': serializeParam(
          _skincolor,
          ParamType.String,
        ),
        'haircolor': serializeParam(
          _haircolor,
          ParamType.String,
        ),
        'eyecolor': serializeParam(
          _eyecolor,
          ParamType.String,
        ),
        'facialhair': serializeParam(
          _facialhair,
          ParamType.String,
        ),
      }.withoutNulls;

  static DisabledProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisabledProfileStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        ethnicity: deserializeParam(
          data['ethnicity'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        skincolor: deserializeParam(
          data['skincolor'],
          ParamType.String,
          false,
        ),
        haircolor: deserializeParam(
          data['haircolor'],
          ParamType.String,
          false,
        ),
        eyecolor: deserializeParam(
          data['eyecolor'],
          ParamType.String,
          false,
        ),
        facialhair: deserializeParam(
          data['facialhair'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DisabledProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisabledProfileStruct &&
        name == other.name &&
        age == other.age &&
        ethnicity == other.ethnicity &&
        gender == other.gender &&
        skincolor == other.skincolor &&
        haircolor == other.haircolor &&
        eyecolor == other.eyecolor &&
        facialhair == other.facialhair;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        age,
        ethnicity,
        gender,
        skincolor,
        haircolor,
        eyecolor,
        facialhair
      ]);
}

DisabledProfileStruct createDisabledProfileStruct({
  String? name,
  int? age,
  String? ethnicity,
  String? gender,
  String? skincolor,
  String? haircolor,
  String? eyecolor,
  String? facialhair,
}) =>
    DisabledProfileStruct(
      name: name,
      age: age,
      ethnicity: ethnicity,
      gender: gender,
      skincolor: skincolor,
      haircolor: haircolor,
      eyecolor: eyecolor,
      facialhair: facialhair,
    );
