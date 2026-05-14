import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter2_password_reset_widget.dart' show Enter2PasswordResetWidget;
import 'package:flutter/material.dart';

class Enter2PasswordResetModel
    extends FlutterFlowModel<Enter2PasswordResetWidget> {
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
