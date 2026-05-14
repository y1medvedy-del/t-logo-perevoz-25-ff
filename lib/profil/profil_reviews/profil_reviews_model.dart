import '/apllication/star_5_coneiner_text/star5_coneiner_text_widget.dart';
import '/components/returne_menu_widget.dart';
import '/components/star55555_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profil_reviews_widget.dart' show ProfilReviewsWidget;
import 'package:flutter/material.dart';

class ProfilReviewsModel extends FlutterFlowModel<ProfilReviewsWidget> {
  ///  Local state fields for this page.

  int? star = 0;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // Model for star_55555 component.
  late Star55555Model star55555Model;
  // Model for star_5_coneiner_text component.
  late Star5ConeinerTextModel star5ConeinerTextModel1;
  // Model for star_5_coneiner_text component.
  late Star5ConeinerTextModel star5ConeinerTextModel2;
  // Model for star_5_coneiner_text component.
  late Star5ConeinerTextModel star5ConeinerTextModel3;
  // Model for star_5_coneiner_text component.
  late Star5ConeinerTextModel star5ConeinerTextModel4;
  // Model for star_5_coneiner_text component.
  late Star5ConeinerTextModel star5ConeinerTextModel5;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    star55555Model = createModel(context, () => Star55555Model());
    star5ConeinerTextModel1 =
        createModel(context, () => Star5ConeinerTextModel());
    star5ConeinerTextModel2 =
        createModel(context, () => Star5ConeinerTextModel());
    star5ConeinerTextModel3 =
        createModel(context, () => Star5ConeinerTextModel());
    star5ConeinerTextModel4 =
        createModel(context, () => Star5ConeinerTextModel());
    star5ConeinerTextModel5 =
        createModel(context, () => Star5ConeinerTextModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    star55555Model.dispose();
    star5ConeinerTextModel1.dispose();
    star5ConeinerTextModel2.dispose();
    star5ConeinerTextModel3.dispose();
    star5ConeinerTextModel4.dispose();
    star5ConeinerTextModel5.dispose();
  }
}
