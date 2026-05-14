import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_f_i_z1_phone_widget.dart' show RegistrationFIZ1PhoneWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationFIZ1PhoneModel
    extends FlutterFlowModel<RegistrationFIZ1PhoneWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
