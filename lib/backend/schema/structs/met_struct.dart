// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetStruct extends BaseStruct {
  MetStruct({
    bool? stress,
    bool? engagement,
    bool? interest,
    bool? excitement,
    bool? attention,
    bool? relaxation,
  })  : _stress = stress,
        _engagement = engagement,
        _interest = interest,
        _excitement = excitement,
        _attention = attention,
        _relaxation = relaxation;

  // "Stress" field.
  bool? _stress;
  bool get stress => _stress ?? false;
  set stress(bool? val) => _stress = val;
  bool hasStress() => _stress != null;

  // "Engagement" field.
  bool? _engagement;
  bool get engagement => _engagement ?? false;
  set engagement(bool? val) => _engagement = val;
  bool hasEngagement() => _engagement != null;

  // "Interest" field.
  bool? _interest;
  bool get interest => _interest ?? false;
  set interest(bool? val) => _interest = val;
  bool hasInterest() => _interest != null;

  // "Excitement" field.
  bool? _excitement;
  bool get excitement => _excitement ?? false;
  set excitement(bool? val) => _excitement = val;
  bool hasExcitement() => _excitement != null;

  // "Attention" field.
  bool? _attention;
  bool get attention => _attention ?? false;
  set attention(bool? val) => _attention = val;
  bool hasAttention() => _attention != null;

  // "Relaxation" field.
  bool? _relaxation;
  bool get relaxation => _relaxation ?? false;
  set relaxation(bool? val) => _relaxation = val;
  bool hasRelaxation() => _relaxation != null;

  static MetStruct fromMap(Map<String, dynamic> data) => MetStruct(
        stress: data['Stress'] as bool?,
        engagement: data['Engagement'] as bool?,
        interest: data['Interest'] as bool?,
        excitement: data['Excitement'] as bool?,
        attention: data['Attention'] as bool?,
        relaxation: data['Relaxation'] as bool?,
      );

  static MetStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Stress': _stress,
        'Engagement': _engagement,
        'Interest': _interest,
        'Excitement': _excitement,
        'Attention': _attention,
        'Relaxation': _relaxation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Stress': serializeParam(
          _stress,
          ParamType.bool,
        ),
        'Engagement': serializeParam(
          _engagement,
          ParamType.bool,
        ),
        'Interest': serializeParam(
          _interest,
          ParamType.bool,
        ),
        'Excitement': serializeParam(
          _excitement,
          ParamType.bool,
        ),
        'Attention': serializeParam(
          _attention,
          ParamType.bool,
        ),
        'Relaxation': serializeParam(
          _relaxation,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MetStruct fromSerializableMap(Map<String, dynamic> data) => MetStruct(
        stress: deserializeParam(
          data['Stress'],
          ParamType.bool,
          false,
        ),
        engagement: deserializeParam(
          data['Engagement'],
          ParamType.bool,
          false,
        ),
        interest: deserializeParam(
          data['Interest'],
          ParamType.bool,
          false,
        ),
        excitement: deserializeParam(
          data['Excitement'],
          ParamType.bool,
          false,
        ),
        attention: deserializeParam(
          data['Attention'],
          ParamType.bool,
          false,
        ),
        relaxation: deserializeParam(
          data['Relaxation'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetStruct &&
        stress == other.stress &&
        engagement == other.engagement &&
        interest == other.interest &&
        excitement == other.excitement &&
        attention == other.attention &&
        relaxation == other.relaxation;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([stress, engagement, interest, excitement, attention, relaxation]);
}

MetStruct createMetStruct({
  bool? stress,
  bool? engagement,
  bool? interest,
  bool? excitement,
  bool? attention,
  bool? relaxation,
}) =>
    MetStruct(
      stress: stress,
      engagement: engagement,
      interest: interest,
      excitement: excitement,
      attention: attention,
      relaxation: relaxation,
    );
