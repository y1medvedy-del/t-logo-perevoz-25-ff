import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'application13_edit_data_time_widget.dart'
    show Application13EditDataTimeWidget;
import 'package:flutter/material.dart';

class Application13EditDataTimeModel
    extends FlutterFlowModel<Application13EditDataTimeWidget> {
  ///  Local state fields for this page.

  DateTime? date;

  String? time;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
