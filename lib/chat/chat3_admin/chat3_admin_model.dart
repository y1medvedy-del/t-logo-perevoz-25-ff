import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'chat3_admin_widget.dart' show Chat3AdminWidget;
import 'package:flutter/material.dart';

class Chat3AdminModel extends FlutterFlowModel<Chat3AdminWidget> {
  ///  Local state fields for this page.

  bool investment = false;

  bool pageEdit = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<MessageRow>>? containerSupabaseStream;
  bool isDataUploading_uploadDataJt9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJt9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJt9 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? messageDoc;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? newMessage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
