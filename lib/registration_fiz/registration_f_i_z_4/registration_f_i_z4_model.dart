import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_f_i_z4_widget.dart' show RegistrationFIZ4Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationFIZ4Model extends FlutterFlowModel<RegistrationFIZ4Widget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for serial_number widget.
  FocusNode? serialNumberFocusNode;
  TextEditingController? serialNumberTextController;
  late MaskTextInputFormatter serialNumberMask;
  String? Function(BuildContext, String?)? serialNumberTextControllerValidator;
  // State field(s) for issued widget.
  FocusNode? issuedFocusNode;
  TextEditingController? issuedTextController;
  String? Function(BuildContext, String?)? issuedTextControllerValidator;
  // State field(s) for date_issue widget.
  FocusNode? dateIssueFocusNode;
  TextEditingController? dateIssueTextController;
  late MaskTextInputFormatter dateIssueMask;
  String? Function(BuildContext, String?)? dateIssueTextControllerValidator;
  // State field(s) for deportament_cod widget.
  FocusNode? deportamentCodFocusNode;
  TextEditingController? deportamentCodTextController;
  late MaskTextInputFormatter deportamentCodMask;
  String? Function(BuildContext, String?)?
      deportamentCodTextControllerValidator;
  // State field(s) for registration_address widget.
  FocusNode? registrationAddressFocusNode;
  TextEditingController? registrationAddressTextController;
  String? Function(BuildContext, String?)?
      registrationAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serialNumberFocusNode?.dispose();
    serialNumberTextController?.dispose();

    issuedFocusNode?.dispose();
    issuedTextController?.dispose();

    dateIssueFocusNode?.dispose();
    dateIssueTextController?.dispose();

    deportamentCodFocusNode?.dispose();
    deportamentCodTextController?.dispose();

    registrationAddressFocusNode?.dispose();
    registrationAddressTextController?.dispose();
  }
}
