import '/flutter_flow/flutter_flow_util.dart';
import 'application_quantity_widget.dart' show ApplicationQuantityWidget;
import 'package:flutter/material.dart';

class ApplicationQuantityModel
    extends FlutterFlowModel<ApplicationQuantityWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
