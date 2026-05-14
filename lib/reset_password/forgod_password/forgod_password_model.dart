import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgod_password_widget.dart' show ForgodPasswordWidget;
import 'package:flutter/material.dart';

class ForgodPasswordModel extends FlutterFlowModel<ForgodPasswordWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
