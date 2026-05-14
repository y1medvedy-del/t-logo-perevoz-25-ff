import '/components/button70048_blue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'compleint3_widget.dart' show Compleint3Widget;
import 'package:flutter/material.dart';

class Compleint3Model extends FlutterFlowModel<Compleint3Widget> {
  ///  Local state fields for this page.

  int? star = 0;

  ///  State fields for stateful widgets in this page.

  // Model for button_700_48_blue component.
  late Button70048BlueModel button70048BlueModel;

  @override
  void initState(BuildContext context) {
    button70048BlueModel = createModel(context, () => Button70048BlueModel());
  }

  @override
  void dispose() {
    button70048BlueModel.dispose();
  }
}
