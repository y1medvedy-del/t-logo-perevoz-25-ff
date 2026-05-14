import '/backend/supabase/supabase.dart';
import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reviews1_widget.dart' show Reviews1Widget;
import 'package:flutter/material.dart';

class Reviews1Model extends FlutterFlowModel<Reviews1Widget> {
  ///  Local state fields for this page.

  int? star = 0;

  String? description;

  List<String> listPhoto = [];
  void addToListPhoto(String item) => listPhoto.add(item);
  void removeFromListPhoto(String item) => listPhoto.remove(item);
  void removeAtIndexFromListPhoto(int index) => listPhoto.removeAt(index);
  void insertAtIndexInListPhoto(int index, String item) =>
      listPhoto.insert(index, item);
  void updateListPhotoAtIndex(int index, Function(String) updateFn) =>
      listPhoto[index] = updateFn(listPhoto[index]);

  List<String> listVideo = [];
  void addToListVideo(String item) => listVideo.add(item);
  void removeFromListVideo(String item) => listVideo.remove(item);
  void removeAtIndexFromListVideo(int index) => listVideo.removeAt(index);
  void insertAtIndexInListVideo(int index, String item) =>
      listVideo.insert(index, item);
  void updateListVideoAtIndex(int index, Function(String) updateFn) =>
      listVideo[index] = updateFn(listVideo[index]);

  /// колличество сделанных цыклов при добавление фото в СБ
  int? numberCyclesPhoto = 0;

  int? numberCyclesVide = 0;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_700_48_blue component.
  late Button70048BlueModel button70048BlueModel;
  // Stores action output result for [Backend Call - Insert Row] action in button_700_48_blue widget.
  ReviewsRow? reviuseInsert;

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
