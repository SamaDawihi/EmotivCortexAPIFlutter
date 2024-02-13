import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'session_widget.dart' show SessionWidget;
import 'package:flutter/material.dart';

class SessionModel extends FlutterFlowModel<SessionWidget> {
  ///  Local state fields for this page.

  String? headsetId;

  String? cortexToken;

  String? licenseInfo;

  String? subscribedStream;

  String? predictedEmotion;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - aGetCortexInfo] action in Session widget.
  String? getCortexInfoCopy;
  // Stores action output result for [Custom Action - aGetUserLogin] action in Session widget.
  String? getUserLogin;
  // Stores action output result for [Custom Action - cHasAccessRight] action in Session widget.
  String? hasAccessRightCopy;
  // Stores action output result for [Custom Action - dQueryHeadset] action in Session widget.
  String? queryHeadsetsCopy;
  // Stores action output result for [Custom Action - eAuthorize] action in Session widget.
  String? authorizeAction;
  // Stores action output result for [Custom Action - hSubscribeMet] action in Session widget.
  MetStruct? subscribeAction;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
