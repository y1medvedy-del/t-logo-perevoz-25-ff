import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'chat2_widget.dart' show Chat2Widget;
import 'package:flutter/material.dart';

class Chat2Model extends FlutterFlowModel<Chat2Widget> {
  ///  Local state fields for this page.

  bool investment = false;

  bool pageEdit = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<MessageRow>>? containerSupabaseStream;
  bool isDataUploading_uploadDataJt9d = false;
  FFUploadedFile uploadedLocalFile_uploadDataJt9d =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJt9d = '';

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
