import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_content_and_doc/application_content_and_doc_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/aswer_work/aswer_work_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_message_and_call_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/reviews/review_button/review_button_widget.dart';
import 'dart:async';
import '/index.dart';
import 'apllication4_widget.dart' show Apllication4Widget;
import 'package:flutter/material.dart';

class Apllication4Model extends FlutterFlowModel<Apllication4Widget> {
  ///  Local state fields for this page.

  bool info = false;

  bool tab = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkPayment] action in apllication4 widget.
  dynamic checkWalletTopupPayment;
  Completer<List<AplicationRow>>? requestCompleter;
  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Model for application_status component.
  late ApplicationStatusModel applicationStatusModel;
  // Model for infoApplication component.
  late InfoApplicationModel infoApplicationModel;
  // Model for applicationContentAndDoc component.
  late ApplicationContentAndDocModel applicationContentAndDocModel;
  // Model for aswerWork component.
  late AswerWorkModel aswerWorkModel;
  // Model for reviewButton component.
  late ReviewButtonModel reviewButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AnswerRow>? answerQuery;
  // Stores action output result for [Custom Action - createApplicationDocPdf] action in Button widget.
  String? urlDocApplicationBlanc;
  // Model for buttonMessageAndCall component.
  late ButtonMessageAndCallModel buttonMessageAndCallModel;

  @override
  void initState(BuildContext context) {
    aCapCancelModel = createModel(context, () => ACapCancelModel());
    applicationStatusModel =
        createModel(context, () => ApplicationStatusModel());
    infoApplicationModel = createModel(context, () => InfoApplicationModel());
    applicationContentAndDocModel =
        createModel(context, () => ApplicationContentAndDocModel());
    aswerWorkModel = createModel(context, () => AswerWorkModel());
    reviewButtonModel = createModel(context, () => ReviewButtonModel());
    buttonMessageAndCallModel =
        createModel(context, () => ButtonMessageAndCallModel());
  }

  @override
  void dispose() {
    aCapCancelModel.dispose();
    applicationStatusModel.dispose();
    infoApplicationModel.dispose();
    applicationContentAndDocModel.dispose();
    aswerWorkModel.dispose();
    reviewButtonModel.dispose();
    buttonMessageAndCallModel.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
