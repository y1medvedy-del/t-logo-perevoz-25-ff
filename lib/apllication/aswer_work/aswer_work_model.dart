import '/apllication/row_icon_text/row_icon_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aswer_work_widget.dart' show AswerWorkWidget;
import 'package:flutter/material.dart';

class AswerWorkModel extends FlutterFlowModel<AswerWorkWidget> {
  ///  Local state fields for this component.

  int? tab = 2;

  ///  State fields for stateful widgets in this component.

  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel1;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel2;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel3;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel4;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel5;

  @override
  void initState(BuildContext context) {
    rowIconTextModel1 = createModel(context, () => RowIconTextModel());
    rowIconTextModel2 = createModel(context, () => RowIconTextModel());
    rowIconTextModel3 = createModel(context, () => RowIconTextModel());
    rowIconTextModel4 = createModel(context, () => RowIconTextModel());
    rowIconTextModel5 = createModel(context, () => RowIconTextModel());
  }

  @override
  void dispose() {
    rowIconTextModel1.dispose();
    rowIconTextModel2.dispose();
    rowIconTextModel3.dispose();
    rowIconTextModel4.dispose();
    rowIconTextModel5.dispose();
  }
}
