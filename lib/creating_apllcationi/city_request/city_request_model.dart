import '/flutter_flow/flutter_flow_util.dart';
import 'city_request_widget.dart' show CityRequestWidget;
import 'package:flutter/material.dart';

class CityRequestModel extends FlutterFlowModel<CityRequestWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
