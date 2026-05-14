import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification1_widget.dart' show Notification1Widget;
import 'package:flutter/material.dart';

class Notification1Model extends FlutterFlowModel<Notification1Widget> {
  ///  Local state fields for this page.
  /// уведомление с выпадающей шторкой
  int? notificationSelect;

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
