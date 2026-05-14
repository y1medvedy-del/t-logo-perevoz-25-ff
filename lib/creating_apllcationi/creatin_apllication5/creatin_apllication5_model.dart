import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication5_widget.dart' show CreatinApllication5Widget;
import 'package:flutter/material.dart';

class CreatinApllication5Model
    extends FlutterFlowModel<CreatinApllication5Widget> {
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

  int stage = 4;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
