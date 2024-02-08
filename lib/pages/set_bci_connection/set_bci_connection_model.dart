import '/flutter_flow/flutter_flow_util.dart';
import 'set_bci_connection_widget.dart' show SetBciConnectionWidget;
import 'package:flutter/material.dart';

class SetBciConnectionModel extends FlutterFlowModel<SetBciConnectionWidget> {
  ///  Local state fields for this page.

  String? aacessError;

  String? getCortexInfoError;

  String? hasAccessError;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - aGetCortexInfo] action in Button widget.
  String? getCortexInfo;
  // Stores action output result for [Custom Action - bRequestAccess] action in Button widget.
  String? accessRequest;
  // Stores action output result for [Custom Action - cHasAccessRight] action in Button widget.
  String? doesHasAccess;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
