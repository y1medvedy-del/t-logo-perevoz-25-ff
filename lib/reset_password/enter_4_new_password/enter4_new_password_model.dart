import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter4_new_password_widget.dart' show Enter4NewPasswordWidget;
import 'package:flutter/material.dart';

class Enter4NewPasswordModel extends FlutterFlowModel<Enter4NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for password2 widget.
  FocusNode? password2FocusNode;
  TextEditingController? password2TextController;
  late bool password2Visibility;
  String? Function(BuildContext, String?)? password2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    password2Visibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    password2FocusNode?.dispose();
    password2TextController?.dispose();
  }
}
