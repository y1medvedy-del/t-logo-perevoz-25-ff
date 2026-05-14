import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_u_r4_o_o_o_widget.dart' show RegistrationUR4OOOWidget;
import 'package:flutter/material.dart';

class RegistrationUR4OOOModel
    extends FlutterFlowModel<RegistrationUR4OOOWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for INN widget.
  FocusNode? innFocusNode;
  TextEditingController? innTextController;
  String? Function(BuildContext, String?)? innTextControllerValidator;
  // Stores action output result for [Backend Call - API (requestCompany)] action in INN widget.
  ApiCallResponse? requsitesCompanyApi;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for kpp widget.
  FocusNode? kppFocusNode;
  TextEditingController? kppTextController;
  String? Function(BuildContext, String?)? kppTextControllerValidator;
  // State field(s) for OGRN widget.
  FocusNode? ogrnFocusNode;
  TextEditingController? ogrnTextController;
  String? Function(BuildContext, String?)? ogrnTextControllerValidator;
  // State field(s) for okpo widget.
  FocusNode? okpoFocusNode;
  TextEditingController? okpoTextController;
  String? Function(BuildContext, String?)? okpoTextControllerValidator;
  // State field(s) for okved widget.
  FocusNode? okvedFocusNode;
  TextEditingController? okvedTextController;
  String? Function(BuildContext, String?)? okvedTextControllerValidator;
  // State field(s) for ur_address widget.
  FocusNode? urAddressFocusNode;
  TextEditingController? urAddressTextController;
  String? Function(BuildContext, String?)? urAddressTextControllerValidator;
  // State field(s) for fact_address widget.
  FocusNode? factAddressFocusNode;
  TextEditingController? factAddressTextController;
  String? Function(BuildContext, String?)? factAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innFocusNode?.dispose();
    innTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    kppFocusNode?.dispose();
    kppTextController?.dispose();

    ogrnFocusNode?.dispose();
    ogrnTextController?.dispose();

    okpoFocusNode?.dispose();
    okpoTextController?.dispose();

    okvedFocusNode?.dispose();
    okvedTextController?.dispose();

    urAddressFocusNode?.dispose();
    urAddressTextController?.dispose();

    factAddressFocusNode?.dispose();
    factAddressTextController?.dispose();
  }
}
