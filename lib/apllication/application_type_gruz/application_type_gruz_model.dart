import '/flutter_flow/flutter_flow_util.dart';
import 'application_type_gruz_widget.dart' show ApplicationTypeGruzWidget;
import 'package:flutter/material.dart';

class ApplicationTypeGruzModel
    extends FlutterFlowModel<ApplicationTypeGruzWidget> {
  ///  Local state fields for this component.

  String? typeGruz;

  ///  State fields for stateful widgets in this component.

  // State field(s) for typeGruz widget.
  FocusNode? typeGruzFocusNode;
  TextEditingController? typeGruzTextController;
  String? Function(BuildContext, String?)? typeGruzTextControllerValidator;
  // State field(s) for service widget.
  FocusNode? serviceFocusNode;
  TextEditingController? serviceTextController;
  String? Function(BuildContext, String?)? serviceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    typeGruzFocusNode?.dispose();
    typeGruzTextController?.dispose();

    serviceFocusNode?.dispose();
    serviceTextController?.dispose();
  }
}
