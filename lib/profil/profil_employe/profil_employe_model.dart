import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/row_next_text/row_next_text_widget.dart';
import '/profil/row_next_text_icon/row_next_text_icon_widget.dart';
import '/index.dart';
import 'profil_employe_widget.dart' show ProfilEmployeWidget;
import 'package:flutter/material.dart';

class ProfilEmployeModel extends FlutterFlowModel<ProfilEmployeWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel1;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel2;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel3;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel4;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel5;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    rowNextTextModel1 = createModel(context, () => RowNextTextModel());
    rowNextTextModel2 = createModel(context, () => RowNextTextModel());
    rowNextTextModel3 = createModel(context, () => RowNextTextModel());
    rowNextTextModel4 = createModel(context, () => RowNextTextModel());
    rowNextTextModel5 = createModel(context, () => RowNextTextModel());
    rowNextTextIconModel = createModel(context, () => RowNextTextIconModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    rowNextTextModel1.dispose();
    rowNextTextModel2.dispose();
    rowNextTextModel3.dispose();
    rowNextTextModel4.dispose();
    rowNextTextModel5.dispose();
    rowNextTextIconModel.dispose();
  }
}
