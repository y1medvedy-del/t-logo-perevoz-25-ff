import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication3_widget.dart' show CreatinApllication3Widget;
import 'package:flutter/material.dart';

class CreatinApllication3Model
    extends FlutterFlowModel<CreatinApllication3Widget> {
  ///  Local state fields for this page.

  String? text = '';

  bool? flag = false;

  int stage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
