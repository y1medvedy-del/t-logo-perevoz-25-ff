import '/flutter_flow/flutter_flow_util.dart';
import 'create_uploading_photo_widget.dart' show CreateUploadingPhotoWidget;
import 'package:flutter/material.dart';

class CreateUploadingPhotoModel
    extends FlutterFlowModel<CreateUploadingPhotoWidget> {
  ///  Local state fields for this component.

  String? photo;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataGalleryPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadDataGalleryPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataGalleryPhoto = '';

  bool isDataUploading_uploadDataCameraPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadDataCameraPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCameraPhoto = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
