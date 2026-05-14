import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/index.dart';
import 'help1_widget.dart' show Help1Widget;
import 'package:flutter/material.dart';

class Help1Model extends FlutterFlowModel<Help1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuPC component.
  late MenuPCModel menuPCModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? cahatAdmin;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? insertChat;

  @override
  void initState(BuildContext context) {
    menuPCModel = createModel(context, () => MenuPCModel());
  }

  @override
  void dispose() {
    menuPCModel.dispose();
  }
}
