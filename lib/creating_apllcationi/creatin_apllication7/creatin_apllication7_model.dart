import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication7_widget.dart' show CreatinApllication7Widget;
import 'package:flutter/material.dart';

class CreatinApllication7Model
    extends FlutterFlowModel<CreatinApllication7Widget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  int stage = 6;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in creatin_apllication7 widget.
  List<DocumentContractRow>? contract;
  // Stores action output result for [Backend Call - Query Rows] action in creatin_apllication7 widget.
  List<WalletsRow>? wallet;
  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // Stores action output result for [Backend Call - Query Rows] action in type_payment widget.
  List<CompanyRow>? myCompanyQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MarkupPraceRow>? markupCompany;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AplicationRow? newApplication;
  // Stores action output result for [Custom Action - addWorksToSupabase] action in Button widget.
  String? result;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
