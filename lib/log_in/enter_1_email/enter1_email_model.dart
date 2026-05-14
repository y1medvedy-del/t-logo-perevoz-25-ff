import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter1_email_widget.dart' show Enter1EmailWidget;
import 'package:flutter/material.dart';

class Enter1EmailModel extends FlutterFlowModel<Enter1EmailWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserRow>? userRow;
  // Stores action output result for [Custom Action - registerPushyToken] action in Button widget.
  String? token;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
