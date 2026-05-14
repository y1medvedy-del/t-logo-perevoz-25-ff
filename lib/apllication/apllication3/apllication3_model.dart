import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/aswer_work/aswer_work_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_message_and_call_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'apllication3_widget.dart' show Apllication3Widget;
import 'package:flutter/material.dart';

class Apllication3Model extends FlutterFlowModel<Apllication3Widget> {
  ///  Local state fields for this page.

  bool info = false;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Stores action output result for [Backend Call - Query Rows] action in a_Cap_cancel widget.
  List<AplicationRow>? applicationQuery;
  // Model for application_status component.
  late ApplicationStatusModel applicationStatusModel;
  // Model for infoApplication component.
  late InfoApplicationModel infoApplicationModel;
  // Model for aswerWork component.
  late AswerWorkModel aswerWorkModel;
  // Model for buttonMessageAndCall component.
  late ButtonMessageAndCallModel buttonMessageAndCallModel;
  // Stores action output result for [Backend Call - Insert Row] action in buttonMessageAndCall widget.
  ChatRow? newChatCopy;
  // Stores action output result for [Backend Call - Query Rows] action in buttonMessageAndCall widget.
  List<UserRow>? userExecuter;

  @override
  void initState(BuildContext context) {
    aCapCancelModel = createModel(context, () => ACapCancelModel());
    applicationStatusModel =
        createModel(context, () => ApplicationStatusModel());
    infoApplicationModel = createModel(context, () => InfoApplicationModel());
    aswerWorkModel = createModel(context, () => AswerWorkModel());
    buttonMessageAndCallModel =
        createModel(context, () => ButtonMessageAndCallModel());
  }

  @override
  void dispose() {
    aCapCancelModel.dispose();
    applicationStatusModel.dispose();
    infoApplicationModel.dispose();
    aswerWorkModel.dispose();
    buttonMessageAndCallModel.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }
}
