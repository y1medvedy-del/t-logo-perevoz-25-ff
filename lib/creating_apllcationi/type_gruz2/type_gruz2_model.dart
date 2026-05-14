import '/flutter_flow/flutter_flow_util.dart';
import 'type_gruz2_widget.dart' show TypeGruz2Widget;
import 'package:flutter/material.dart';

class TypeGruz2Model extends FlutterFlowModel<TypeGruz2Widget> {
  ///  Local state fields for this component.

  String? typeGruz;

  bool nameCargo = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for typeGruz widget.
  FocusNode? typeGruzFocusNode;
  TextEditingController? typeGruzTextController;
  String? Function(BuildContext, String?)? typeGruzTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    typeGruzFocusNode?.dispose();
    typeGruzTextController?.dispose();
  }
}
