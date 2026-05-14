import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_add_draiver_widget.dart' show ProfilAddDraiverWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilAddDraiverModel extends FlutterFlowModel<ProfilAddDraiverWidget> {
  ///  Local state fields for this component.

  String? phone;

  bool? phoneText;

  ///  State fields for stateful widgets in this component.

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode1;
  TextEditingController? surnameTextController1;
  String? Function(BuildContext, String?)? surnameTextController1Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode2;
  TextEditingController? surnameTextController2;
  String? Function(BuildContext, String?)? surnameTextController2Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  late MaskTextInputFormatter phoneMask;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DriversRow>? queryDriver;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    surnameFocusNode1?.dispose();
    surnameTextController1?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    surnameFocusNode2?.dispose();
    surnameTextController2?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
