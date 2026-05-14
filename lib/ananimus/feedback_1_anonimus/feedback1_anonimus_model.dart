import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'feedback1_anonimus_widget.dart' show Feedback1AnonimusWidget;
import 'package:flutter/material.dart';

class Feedback1AnonimusModel extends FlutterFlowModel<Feedback1AnonimusWidget> {
  ///  Local state fields for this page.

  int? star = 0;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
