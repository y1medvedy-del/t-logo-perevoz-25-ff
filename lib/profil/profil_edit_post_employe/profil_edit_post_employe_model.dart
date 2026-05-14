import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/text_fild/text_fild_widget.dart';
import 'profil_edit_post_employe_widget.dart' show ProfilEditPostEmployeWidget;
import 'package:flutter/material.dart';

class ProfilEditPostEmployeModel
    extends FlutterFlowModel<ProfilEditPostEmployeWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // Model for text_fild component.
  late TextFildModel textFildModel;
  // Model for button_700_48_blue component.
  late Button70048BlueModel button70048BlueModel;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    textFildModel = createModel(context, () => TextFildModel());
    button70048BlueModel = createModel(context, () => Button70048BlueModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    textFildModel.dispose();
    button70048BlueModel.dispose();
  }
}
