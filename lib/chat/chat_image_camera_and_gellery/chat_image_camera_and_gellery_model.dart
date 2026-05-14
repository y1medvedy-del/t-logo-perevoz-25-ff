import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_image_camera_and_gellery_widget.dart'
    show ChatImageCameraAndGelleryWidget;
import 'package:flutter/material.dart';

class ChatImageCameraAndGelleryModel
    extends FlutterFlowModel<ChatImageCameraAndGelleryWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData22 = false;
  FFUploadedFile uploadedLocalFile_uploadData22 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData22 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? messagVideoCopy;
  bool isDataUploading_uploadData = false;
  FFUploadedFile uploadedLocalFile_uploadData =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MessageRow? messagPhoto;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
