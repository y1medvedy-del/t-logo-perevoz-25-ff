import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'apllication1_widget.dart' show Apllication1Widget;
import 'package:flutter/material.dart';

class Apllication1Model extends FlutterFlowModel<Apllication1Widget> {
  ///  Local state fields for this page.

  bool info = false;

  double? filterDistantion;

  int? filterPrice;

  bool? filterFaivorites;

  ///  State fields for stateful widgets in this page.

  Stream<List<AplicationRow>>? apllication1SupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in apllication1 widget.
  List<MarkupPraceRow>? markupCompany;
  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Model for application_status component.
  late ApplicationStatusModel applicationStatusModel;
  // Model for infoApplication component.
  late InfoApplicationModel infoApplicationModel;
  Stream<List<AnswerRow>>? conditionalBuilderSupabaseStream;
  // Model for button_48_48 component.
  late Button4848Model button4848Model;

  @override
  void initState(BuildContext context) {
    aCapCancelModel = createModel(context, () => ACapCancelModel());
    applicationStatusModel =
        createModel(context, () => ApplicationStatusModel());
    infoApplicationModel = createModel(context, () => InfoApplicationModel());
    button4848Model = createModel(context, () => Button4848Model());
  }

  @override
  void dispose() {
    aCapCancelModel.dispose();
    applicationStatusModel.dispose();
    infoApplicationModel.dispose();
    button4848Model.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }
}
