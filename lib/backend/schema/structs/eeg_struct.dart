// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EegStruct extends BaseStruct {
  EegStruct({
    List<double>? af3,
    List<double>? f7,
    List<double>? f3,
    List<double>? fc5,
    List<double>? t7,
    List<double>? p7,
    List<double>? o1,
    List<double>? o2,
    List<double>? p8,
    List<double>? t8,
    List<double>? af4,
  })  : _af3 = af3,
        _f7 = f7,
        _f3 = f3,
        _fc5 = fc5,
        _t7 = t7,
        _p7 = p7,
        _o1 = o1,
        _o2 = o2,
        _p8 = p8,
        _t8 = t8,
        _af4 = af4;

  // "AF3" field.
  List<double>? _af3;
  List<double> get af3 => _af3 ?? const [];
  set af3(List<double>? val) => _af3 = val;
  void updateAf3(Function(List<double>) updateFn) => updateFn(_af3 ??= []);
  bool hasAf3() => _af3 != null;

  // "F7" field.
  List<double>? _f7;
  List<double> get f7 => _f7 ?? const [];
  set f7(List<double>? val) => _f7 = val;
  void updateF7(Function(List<double>) updateFn) => updateFn(_f7 ??= []);
  bool hasF7() => _f7 != null;

  // "F3" field.
  List<double>? _f3;
  List<double> get f3 => _f3 ?? const [];
  set f3(List<double>? val) => _f3 = val;
  void updateF3(Function(List<double>) updateFn) => updateFn(_f3 ??= []);
  bool hasF3() => _f3 != null;

  // "FC5" field.
  List<double>? _fc5;
  List<double> get fc5 => _fc5 ?? const [];
  set fc5(List<double>? val) => _fc5 = val;
  void updateFc5(Function(List<double>) updateFn) => updateFn(_fc5 ??= []);
  bool hasFc5() => _fc5 != null;

  // "T7" field.
  List<double>? _t7;
  List<double> get t7 => _t7 ?? const [];
  set t7(List<double>? val) => _t7 = val;
  void updateT7(Function(List<double>) updateFn) => updateFn(_t7 ??= []);
  bool hasT7() => _t7 != null;

  // "P7" field.
  List<double>? _p7;
  List<double> get p7 => _p7 ?? const [];
  set p7(List<double>? val) => _p7 = val;
  void updateP7(Function(List<double>) updateFn) => updateFn(_p7 ??= []);
  bool hasP7() => _p7 != null;

  // "O1" field.
  List<double>? _o1;
  List<double> get o1 => _o1 ?? const [];
  set o1(List<double>? val) => _o1 = val;
  void updateO1(Function(List<double>) updateFn) => updateFn(_o1 ??= []);
  bool hasO1() => _o1 != null;

  // "O2" field.
  List<double>? _o2;
  List<double> get o2 => _o2 ?? const [];
  set o2(List<double>? val) => _o2 = val;
  void updateO2(Function(List<double>) updateFn) => updateFn(_o2 ??= []);
  bool hasO2() => _o2 != null;

  // "P8" field.
  List<double>? _p8;
  List<double> get p8 => _p8 ?? const [];
  set p8(List<double>? val) => _p8 = val;
  void updateP8(Function(List<double>) updateFn) => updateFn(_p8 ??= []);
  bool hasP8() => _p8 != null;

  // "T8" field.
  List<double>? _t8;
  List<double> get t8 => _t8 ?? const [];
  set t8(List<double>? val) => _t8 = val;
  void updateT8(Function(List<double>) updateFn) => updateFn(_t8 ??= []);
  bool hasT8() => _t8 != null;

  // "AF4" field.
  List<double>? _af4;
  List<double> get af4 => _af4 ?? const [];
  set af4(List<double>? val) => _af4 = val;
  void updateAf4(Function(List<double>) updateFn) => updateFn(_af4 ??= []);
  bool hasAf4() => _af4 != null;

  static EegStruct fromMap(Map<String, dynamic> data) => EegStruct(
        af3: getDataList(data['AF3']),
        f7: getDataList(data['F7']),
        f3: getDataList(data['F3']),
        fc5: getDataList(data['FC5']),
        t7: getDataList(data['T7']),
        p7: getDataList(data['P7']),
        o1: getDataList(data['O1']),
        o2: getDataList(data['O2']),
        p8: getDataList(data['P8']),
        t8: getDataList(data['T8']),
        af4: getDataList(data['AF4']),
      );

  static EegStruct? maybeFromMap(dynamic data) =>
      data is Map ? EegStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'AF3': _af3,
        'F7': _f7,
        'F3': _f3,
        'FC5': _fc5,
        'T7': _t7,
        'P7': _p7,
        'O1': _o1,
        'O2': _o2,
        'P8': _p8,
        'T8': _t8,
        'AF4': _af4,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AF3': serializeParam(
          _af3,
          ParamType.double,
          true,
        ),
        'F7': serializeParam(
          _f7,
          ParamType.double,
          true,
        ),
        'F3': serializeParam(
          _f3,
          ParamType.double,
          true,
        ),
        'FC5': serializeParam(
          _fc5,
          ParamType.double,
          true,
        ),
        'T7': serializeParam(
          _t7,
          ParamType.double,
          true,
        ),
        'P7': serializeParam(
          _p7,
          ParamType.double,
          true,
        ),
        'O1': serializeParam(
          _o1,
          ParamType.double,
          true,
        ),
        'O2': serializeParam(
          _o2,
          ParamType.double,
          true,
        ),
        'P8': serializeParam(
          _p8,
          ParamType.double,
          true,
        ),
        'T8': serializeParam(
          _t8,
          ParamType.double,
          true,
        ),
        'AF4': serializeParam(
          _af4,
          ParamType.double,
          true,
        ),
      }.withoutNulls;

  static EegStruct fromSerializableMap(Map<String, dynamic> data) => EegStruct(
        af3: deserializeParam<double>(
          data['AF3'],
          ParamType.double,
          true,
        ),
        f7: deserializeParam<double>(
          data['F7'],
          ParamType.double,
          true,
        ),
        f3: deserializeParam<double>(
          data['F3'],
          ParamType.double,
          true,
        ),
        fc5: deserializeParam<double>(
          data['FC5'],
          ParamType.double,
          true,
        ),
        t7: deserializeParam<double>(
          data['T7'],
          ParamType.double,
          true,
        ),
        p7: deserializeParam<double>(
          data['P7'],
          ParamType.double,
          true,
        ),
        o1: deserializeParam<double>(
          data['O1'],
          ParamType.double,
          true,
        ),
        o2: deserializeParam<double>(
          data['O2'],
          ParamType.double,
          true,
        ),
        p8: deserializeParam<double>(
          data['P8'],
          ParamType.double,
          true,
        ),
        t8: deserializeParam<double>(
          data['T8'],
          ParamType.double,
          true,
        ),
        af4: deserializeParam<double>(
          data['AF4'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'EegStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EegStruct &&
        listEquality.equals(af3, other.af3) &&
        listEquality.equals(f7, other.f7) &&
        listEquality.equals(f3, other.f3) &&
        listEquality.equals(fc5, other.fc5) &&
        listEquality.equals(t7, other.t7) &&
        listEquality.equals(p7, other.p7) &&
        listEquality.equals(o1, other.o1) &&
        listEquality.equals(o2, other.o2) &&
        listEquality.equals(p8, other.p8) &&
        listEquality.equals(t8, other.t8) &&
        listEquality.equals(af4, other.af4);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([af3, f7, f3, fc5, t7, p7, o1, o2, p8, t8, af4]);
}

EegStruct createEegStruct() => EegStruct();
