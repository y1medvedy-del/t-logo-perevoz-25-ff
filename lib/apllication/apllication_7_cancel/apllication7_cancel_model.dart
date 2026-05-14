import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/info_answer/info_answer_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'apllication7_cancel_widget.dart' show Apllication7CancelWidget;
import 'package:flutter/material.dart';

class Apllication7CancelModel
    extends FlutterFlowModel<Apllication7CancelWidget> {
  ///  Local state fields for this page.

  bool info = true;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Model for application_status component.
  late ApplicationStatusModel applicationStatusModel;
  // Model for infoApplication component.
  late InfoApplicationModel infoApplicationModel;
  // Model for info_answer component.
  late InfoAnswerModel infoAnswerModel;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AplicationRow? newApplication;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CityRow>? cityQuery;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<AplicationRow>? numberApplication;

  @override
  void initState(BuildContext context) {
    aCapCancelModel = createModel(context, () => ACapCancelModel());
    applicationStatusModel =
        createModel(context, () => ApplicationStatusModel());
    infoApplicationModel = createModel(context, () => InfoApplicationModel());
    infoAnswerModel = createModel(context, () => InfoAnswerModel());
  }

  @override
  void dispose() {
    aCapCancelModel.dispose();
    applicationStatusModel.dispose();
    infoApplicationModel.dispose();
    infoAnswerModel.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }
}
