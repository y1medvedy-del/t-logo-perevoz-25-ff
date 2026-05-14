import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_f_i_z3_widget.dart' show RegistrationFIZ3Widget;
import 'package:flutter/material.dart';

class RegistrationFIZ3Model extends FlutterFlowModel<RegistrationFIZ3Widget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for patronymic widget.
  FocusNode? patronymicFocusNode;
  TextEditingController? patronymicTextController;
  String? Function(BuildContext, String?)? patronymicTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CompanyRow>? company;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    patronymicFocusNode?.dispose();
    patronymicTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
