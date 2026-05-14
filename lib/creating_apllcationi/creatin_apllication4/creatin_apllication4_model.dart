import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'creatin_apllication4_widget.dart' show CreatinApllication4Widget;
import 'package:flutter/material.dart';

class CreatinApllication4Model
    extends FlutterFlowModel<CreatinApllication4Widget> {
  ///  Local state fields for this page.

  DateTime? date;

  String? time;

  int stage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
