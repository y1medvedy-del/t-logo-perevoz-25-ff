import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/info_answer/info_answer_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'apllication2_widget.dart' show Apllication2Widget;
import 'package:flutter/material.dart';

class Apllication2Model extends FlutterFlowModel<Apllication2Widget> {
  ///  Local state fields for this page.

  bool info = false;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Model for application_status component.
  late ApplicationStatusModel applicationStatusModel;
  // Model for infoApplication component.
  late InfoApplicationModel infoApplicationModel;
  // Model for info_answer component.
  late InfoAnswerModel infoAnswerModel;

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
