import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'archive_widget.dart' show ArchiveWidget;
import 'package:flutter/material.dart';

class ArchiveModel extends FlutterFlowModel<ArchiveWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_48_48 component.
  late Button4848Model button4848Model;
  Stream<List<AplicationRow>>? actionSupabaseStream;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    button4848Model = createModel(context, () => Button4848Model());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    button4848Model.dispose();
  }
}
