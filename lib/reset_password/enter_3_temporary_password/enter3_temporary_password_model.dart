import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter3_temporary_password_widget.dart'
    show Enter3TemporaryPasswordWidget;
import 'package:flutter/material.dart';

class Enter3TemporaryPasswordModel
    extends FlutterFlowModel<Enter3TemporaryPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
