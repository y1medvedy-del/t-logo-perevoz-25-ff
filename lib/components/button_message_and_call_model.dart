import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'button_message_and_call_widget.dart' show ButtonMessageAndCallWidget;
import 'package:flutter/material.dart';

class ButtonMessageAndCallModel
    extends FlutterFlowModel<ButtonMessageAndCallWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  ChatRow? newChat1;
  // Stores action output result for [Backend Call - Update Row(s)] action in IconButton widget.
  List<AplicationRow>? updateChat;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UserRow>? queryUserExecuter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
