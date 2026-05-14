import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'application17_description_widget.dart'
    show Application17DescriptionWidget;
import 'package:flutter/material.dart';

class Application17DescriptionModel
    extends FlutterFlowModel<Application17DescriptionWidget> {
  ///  Local state fields for this page.

  List<String> pfotoList = [];
  void addToPfotoList(String item) => pfotoList.add(item);
  void removeFromPfotoList(String item) => pfotoList.remove(item);
  void removeAtIndexFromPfotoList(int index) => pfotoList.removeAt(index);
  void insertAtIndexInPfotoList(int index, String item) =>
      pfotoList.insert(index, item);
  void updatePfotoListAtIndex(int index, Function(String) updateFn) =>
      pfotoList[index] = updateFn(pfotoList[index]);

  List<String> videoList = [];
  void addToVideoList(String item) => videoList.add(item);
  void removeFromVideoList(String item) => videoList.remove(item);
  void removeAtIndexFromVideoList(int index) => videoList.removeAt(index);
  void insertAtIndexInVideoList(int index, String item) =>
      videoList.insert(index, item);
  void updateVideoListAtIndex(int index, Function(String) updateFn) =>
      videoList[index] = updateFn(videoList[index]);

  FFUploadedFile? localFoto;

  ///  State fields for stateful widgets in this page.

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
