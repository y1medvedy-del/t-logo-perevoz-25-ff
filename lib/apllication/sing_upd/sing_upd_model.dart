import '/flutter_flow/flutter_flow_util.dart';
import 'sing_upd_widget.dart' show SingUpdWidget;
import 'package:flutter/material.dart';

class SingUpdModel extends FlutterFlowModel<SingUpdWidget> {
  ///  Local state fields for this component.
  /// дата подписания в окне
  DateTime? dateSigterComponent;

  ///  State fields for stateful widgets in this component.

  // State field(s) for jobTitle widget.
  FocusNode? jobTitleFocusNode1;
  TextEditingController? jobTitleTextController1;
  String? Function(BuildContext, String?)? jobTitleTextController1Validator;
  // State field(s) for jobTitle widget.
  FocusNode? jobTitleFocusNode2;
  TextEditingController? jobTitleTextController2;
  String? Function(BuildContext, String?)? jobTitleTextController2Validator;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - addClientToJson] action in Button widget.
  dynamic newJsonData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    jobTitleFocusNode1?.dispose();
    jobTitleTextController1?.dispose();

    jobTitleFocusNode2?.dispose();
    jobTitleTextController2?.dispose();
  }
}
