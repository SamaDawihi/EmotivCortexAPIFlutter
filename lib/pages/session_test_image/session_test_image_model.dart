import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'session_test_image_widget.dart' show SessionTestImageWidget;
import 'package:flutter/material.dart';

class SessionTestImageModel extends FlutterFlowModel<SessionTestImageWidget> {
  ///  Local state fields for this page.

  String? predictedEmotion;

  String imagePath = 'https://www.ledr.com/colours/white.jpg';

  String status = 'status';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getImgId)] action in Button widget.
  ApiCallResponse? imageId;
  // Stores action output result for [Backend Call - API (getImg)] action in Button widget.
  ApiCallResponse? returnedImage;

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
