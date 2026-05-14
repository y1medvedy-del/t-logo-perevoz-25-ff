import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compleint1_widget.dart' show Compleint1Widget;
import 'package:flutter/material.dart';

class Compleint1Model extends FlutterFlowModel<Compleint1Widget> {
  ///  Local state fields for this page.

  int? star = 0;

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
