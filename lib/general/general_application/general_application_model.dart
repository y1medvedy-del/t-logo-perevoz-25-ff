import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'general_application_widget.dart' show GeneralApplicationWidget;
import 'package:flutter/material.dart';

class GeneralApplicationModel
    extends FlutterFlowModel<GeneralApplicationWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<AplicationRow>? numberApplication;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<CityRow>? cityQuery;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  AplicationRow? newApplication;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
