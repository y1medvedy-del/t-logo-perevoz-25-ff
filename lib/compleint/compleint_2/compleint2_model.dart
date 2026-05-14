import '/backend/supabase/supabase.dart';
import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compleint2_widget.dart' show Compleint2Widget;
import 'package:flutter/material.dart';

class Compleint2Model extends FlutterFlowModel<Compleint2Widget> {
  ///  Local state fields for this page.

  int? star = 0;

  List<String> photoList = [];
  void addToPhotoList(String item) => photoList.add(item);
  void removeFromPhotoList(String item) => photoList.remove(item);
  void removeAtIndexFromPhotoList(int index) => photoList.removeAt(index);
  void insertAtIndexInPhotoList(int index, String item) =>
      photoList.insert(index, item);
  void updatePhotoListAtIndex(int index, Function(String) updateFn) =>
      photoList[index] = updateFn(photoList[index]);

  List<String> videoList = [];
  void addToVideoList(String item) => videoList.add(item);
  void removeFromVideoList(String item) => videoList.remove(item);
  void removeAtIndexFromVideoList(int index) => videoList.removeAt(index);
  void insertAtIndexInVideoList(int index, String item) =>
      videoList.insert(index, item);
  void updateVideoListAtIndex(int index, Function(String) updateFn) =>
      videoList[index] = updateFn(videoList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto = '';

  bool isDataUploading_uploadDataD0t = false;
  FFUploadedFile uploadedLocalFile_uploadDataD0t =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataD0t = '';

  // Model for button_700_48_blue component.
  late Button70048BlueModel button70048BlueModel;
  // Stores action output result for [Backend Call - Insert Row] action in button_700_48_blue widget.
  ComplaintRow? newComplaint;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    button70048BlueModel = createModel(context, () => Button70048BlueModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    button70048BlueModel.dispose();
  }
}
