// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetStruct extends BaseStruct {
  MetStruct({
    bool? stressSet,
    bool? engagementSet,
    bool? interestSet,
    bool? excitementSet,
    bool? attentionSet,
    bool? relaxationSet,
    int? stress,
    int? engagement,
    int? interest,
    int? excitement,
    int? attention,
    int? relaxation,
  })  : _stressSet = stressSet,
        _engagementSet = engagementSet,
        _interestSet = interestSet,
        _excitementSet = excitementSet,
        _attentionSet = attentionSet,
        _relaxationSet = relaxationSet,
        _stress = stress,
        _engagement = engagement,
        _interest = interest,
        _excitement = excitement,
        _attention = attention,
        _relaxation = relaxation;

  // "StressSet" field.
  bool? _stressSet;
  bool get stressSet => _stressSet ?? false;
  set stressSet(bool? val) => _stressSet = val;
  bool hasStressSet() => _stressSet != null;

  // "EngagementSet" field.
  bool? _engagementSet;
  bool get engagementSet => _engagementSet ?? false;
  set engagementSet(bool? val) => _engagementSet = val;
  bool hasEngagementSet() => _engagementSet != null;

  // "InterestSet" field.
  bool? _interestSet;
  bool get interestSet => _interestSet ?? false;
  set interestSet(bool? val) => _interestSet = val;
  bool hasInterestSet() => _interestSet != null;

  // "ExcitementSet" field.
  bool? _excitementSet;
  bool get excitementSet => _excitementSet ?? false;
  set excitementSet(bool? val) => _excitementSet = val;
  bool hasExcitementSet() => _excitementSet != null;

  // "AttentionSet" field.
  bool? _attentionSet;
  bool get attentionSet => _attentionSet ?? false;
  set attentionSet(bool? val) => _attentionSet = val;
  bool hasAttentionSet() => _attentionSet != null;

  // "RelaxationSet" field.
  bool? _relaxationSet;
  bool get relaxationSet => _relaxationSet ?? false;
  set relaxationSet(bool? val) => _relaxationSet = val;
  bool hasRelaxationSet() => _relaxationSet != null;

  // "Stress" field.
  int? _stress;
  int get stress => _stress ?? 0;
  set stress(int? val) => _stress = val;
  void incrementStress(int amount) => _stress = stress + amount;
  bool hasStress() => _stress != null;

  // "Engagement" field.
  int? _engagement;
  int get engagement => _engagement ?? 0;
  set engagement(int? val) => _engagement = val;
  void incrementEngagement(int amount) => _engagement = engagement + amount;
  bool hasEngagement() => _engagement != null;

  // "Interest" field.
  int? _interest;
  int get interest => _interest ?? 0;
  set interest(int? val) => _interest = val;
  void incrementInterest(int amount) => _interest = interest + amount;
  bool hasInterest() => _interest != null;

  // "Excitement" field.
  int? _excitement;
  int get excitement => _excitement ?? 0;
  set excitement(int? val) => _excitement = val;
  void incrementExcitement(int amount) => _excitement = excitement + amount;
  bool hasExcitement() => _excitement != null;

  // "Attention" field.
  int? _attention;
  int get attention => _attention ?? 0;
  set attention(int? val) => _attention = val;
  void incrementAttention(int amount) => _attention = attention + amount;
  bool hasAttention() => _attention != null;

  // "Relaxation" field.
  int? _relaxation;
  int get relaxation => _relaxation ?? 0;
  set relaxation(int? val) => _relaxation = val;
  void incrementRelaxation(int amount) => _relaxation = relaxation + amount;
  bool hasRelaxation() => _relaxation != null;

  static MetStruct fromMap(Map<String, dynamic> data) => MetStruct(
        stressSet: data['StressSet'] as bool?,
        engagementSet: data['EngagementSet'] as bool?,
        interestSet: data['InterestSet'] as bool?,
        excitementSet: data['ExcitementSet'] as bool?,
        attentionSet: data['AttentionSet'] as bool?,
        relaxationSet: data['RelaxationSet'] as bool?,
        stress: castToType<int>(data['Stress']),
        engagement: castToType<int>(data['Engagement']),
        interest: castToType<int>(data['Interest']),
        excitement: castToType<int>(data['Excitement']),
        attention: castToType<int>(data['Attention']),
        relaxation: castToType<int>(data['Relaxation']),
      );

  static MetStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'StressSet': _stressSet,
        'EngagementSet': _engagementSet,
        'InterestSet': _interestSet,
        'ExcitementSet': _excitementSet,
        'AttentionSet': _attentionSet,
        'RelaxationSet': _relaxationSet,
        'Stress': _stress,
        'Engagement': _engagement,
        'Interest': _interest,
        'Excitement': _excitement,
        'Attention': _attention,
        'Relaxation': _relaxation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'StressSet': serializeParam(
          _stressSet,
          ParamType.bool,
        ),
        'EngagementSet': serializeParam(
          _engagementSet,
          ParamType.bool,
        ),
        'InterestSet': serializeParam(
          _interestSet,
          ParamType.bool,
        ),
        'ExcitementSet': serializeParam(
          _excitementSet,
          ParamType.bool,
        ),
        'AttentionSet': serializeParam(
          _attentionSet,
          ParamType.bool,
        ),
        'RelaxationSet': serializeParam(
          _relaxationSet,
          ParamType.bool,
        ),
        'Stress': serializeParam(
          _stress,
          ParamType.int,
        ),
        'Engagement': serializeParam(
          _engagement,
          ParamType.int,
        ),
        'Interest': serializeParam(
          _interest,
          ParamType.int,
        ),
        'Excitement': serializeParam(
          _excitement,
          ParamType.int,
        ),
        'Attention': serializeParam(
          _attention,
          ParamType.int,
        ),
        'Relaxation': serializeParam(
          _relaxation,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetStruct fromSerializableMap(Map<String, dynamic> data) => MetStruct(
        stressSet: deserializeParam(
          data['StressSet'],
          ParamType.bool,
          false,
        ),
        engagementSet: deserializeParam(
          data['EngagementSet'],
          ParamType.bool,
          false,
        ),
        interestSet: deserializeParam(
          data['InterestSet'],
          ParamType.bool,
          false,
        ),
        excitementSet: deserializeParam(
          data['ExcitementSet'],
          ParamType.bool,
          false,
        ),
        attentionSet: deserializeParam(
          data['AttentionSet'],
          ParamType.bool,
          false,
        ),
        relaxationSet: deserializeParam(
          data['RelaxationSet'],
          ParamType.bool,
          false,
        ),
        stress: deserializeParam(
          data['Stress'],
          ParamType.int,
          false,
        ),
        engagement: deserializeParam(
          data['Engagement'],
          ParamType.int,
          false,
        ),
        interest: deserializeParam(
          data['Interest'],
          ParamType.int,
          false,
        ),
        excitement: deserializeParam(
          data['Excitement'],
          ParamType.int,
          false,
        ),
        attention: deserializeParam(
          data['Attention'],
          ParamType.int,
          false,
        ),
        relaxation: deserializeParam(
          data['Relaxation'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetStruct &&
        stressSet == other.stressSet &&
        engagementSet == other.engagementSet &&
        interestSet == other.interestSet &&
        excitementSet == other.excitementSet &&
        attentionSet == other.attentionSet &&
        relaxationSet == other.relaxationSet &&
        stress == other.stress &&
        engagement == other.engagement &&
        interest == other.interest &&
        excitement == other.excitement &&
        attention == other.attention &&
        relaxation == other.relaxation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        stressSet,
        engagementSet,
        interestSet,
        excitementSet,
        attentionSet,
        relaxationSet,
        stress,
        engagement,
        interest,
        excitement,
        attention,
        relaxation
      ]);
}

MetStruct createMetStruct({
  bool? stressSet,
  bool? engagementSet,
  bool? interestSet,
  bool? excitementSet,
  bool? attentionSet,
  bool? relaxationSet,
  int? stress,
  int? engagement,
  int? interest,
  int? excitement,
  int? attention,
  int? relaxation,
}) =>
    MetStruct(
      stressSet: stressSet,
      engagementSet: engagementSet,
      interestSet: interestSet,
      excitementSet: excitementSet,
      attentionSet: attentionSet,
      relaxationSet: relaxationSet,
      stress: stress,
      engagement: engagement,
      interest: interest,
      excitement: excitement,
      attention: attention,
      relaxation: relaxation,
    );
