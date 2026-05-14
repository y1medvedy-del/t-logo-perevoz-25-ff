import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_video_camera_and_gellery_widget.dart'
    show ChatVideoCameraAndGelleryWidget;
import 'package:flutter/material.dart';

class ChatVideoCameraAndGelleryModel
    extends FlutterFlowModel<ChatVideoCameraAndGelleryWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData2 = false;
  FFUploadedFile uploadedLocalFile_uploadData2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? messagPhotoCopy;
  bool isDataUploading_uploadDataVideoCam = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideoCam =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideoCam = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? messagPhoto;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
