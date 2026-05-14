import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication1_widget.dart' show CreatinApllication1Widget;
import 'package:flutter/material.dart';

class CreatinApllication1Model
    extends FlutterFlowModel<CreatinApllication1Widget> {
  ///  Local state fields for this page.

  String? cityName;

  int? cityID;

  int stage = 1;

  String? cityAbriviatyre;

  /// область выбранного города
  String? cityArea;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<FineRow>? fine;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
