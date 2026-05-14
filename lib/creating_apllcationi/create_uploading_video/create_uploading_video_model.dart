import '/flutter_flow/flutter_flow_util.dart';
import 'create_uploading_video_widget.dart' show CreateUploadingVideoWidget;
import 'package:flutter/material.dart';

class CreateUploadingVideoModel
    extends FlutterFlowModel<CreateUploadingVideoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataGallery = false;
  FFUploadedFile uploadedLocalFile_uploadDataGallery =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataGallery = '';

  bool isDataUploading_uploadDataCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCamera = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
