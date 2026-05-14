import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/row_next_text/row_next_text_widget.dart';
import 'profil_recvisites_company_ooo_widget.dart'
    show ProfilRecvisitesCompanyOooWidget;
import 'package:flutter/material.dart';

class ProfilRecvisitesCompanyOooModel
    extends FlutterFlowModel<ProfilRecvisitesCompanyOooWidget> {
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
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel6;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel7;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel8;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel9;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel10;
  // Model for row_next_text component.
  late RowNextTextModel rowNextTextModel11;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    rowNextTextModel1 = createModel(context, () => RowNextTextModel());
    rowNextTextModel2 = createModel(context, () => RowNextTextModel());
    rowNextTextModel3 = createModel(context, () => RowNextTextModel());
    rowNextTextModel4 = createModel(context, () => RowNextTextModel());
    rowNextTextModel5 = createModel(context, () => RowNextTextModel());
    rowNextTextModel6 = createModel(context, () => RowNextTextModel());
    rowNextTextModel7 = createModel(context, () => RowNextTextModel());
    rowNextTextModel8 = createModel(context, () => RowNextTextModel());
    rowNextTextModel9 = createModel(context, () => RowNextTextModel());
    rowNextTextModel10 = createModel(context, () => RowNextTextModel());
    rowNextTextModel11 = createModel(context, () => RowNextTextModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    rowNextTextModel1.dispose();
    rowNextTextModel2.dispose();
    rowNextTextModel3.dispose();
    rowNextTextModel4.dispose();
    rowNextTextModel5.dispose();
    rowNextTextModel6.dispose();
    rowNextTextModel7.dispose();
    rowNextTextModel8.dispose();
    rowNextTextModel9.dispose();
    rowNextTextModel10.dispose();
    rowNextTextModel11.dispose();
  }
}
