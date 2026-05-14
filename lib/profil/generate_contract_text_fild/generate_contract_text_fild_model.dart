import '/flutter_flow/flutter_flow_util.dart';
import 'generate_contract_text_fild_widget.dart'
    show GenerateContractTextFildWidget;
import 'package:flutter/material.dart';

class GenerateContractTextFildModel
    extends FlutterFlowModel<GenerateContractTextFildWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textFild widget.
  FocusNode? textFildFocusNode;
  TextEditingController? textFildTextController;
  String? Function(BuildContext, String?)? textFildTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFildFocusNode?.dispose();
    textFildTextController?.dispose();
  }
}
