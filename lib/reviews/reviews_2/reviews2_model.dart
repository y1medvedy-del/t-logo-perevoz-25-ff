import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reviews2_widget.dart' show Reviews2Widget;
import 'package:flutter/material.dart';

class Reviews2Model extends FlutterFlowModel<Reviews2Widget> {
  ///  Local state fields for this page.

  int? star = 0;

  String? description;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
  }
}
