import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profil_edit_phone_widget.dart' show ProfilEditPhoneWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfilEditPhoneModel extends FlutterFlowModel<ProfilEditPhoneWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_700_48_blue component.
  late Button70048BlueModel button70048BlueModel;

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
