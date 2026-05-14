import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/notifications/notifications_widget.dart';
import 'menu_p_c_widget.dart' show MenuPCWidget;
import 'package:flutter/material.dart';

class MenuPCModel extends FlutterFlowModel<MenuPCWidget> {
  ///  State fields for stateful widgets in this component.

  Stream<List<NotificationsRow>>? containerSupabaseStream;
  // Model for notifications component.
  late NotificationsModel notificationsModel;

  @override
  void initState(BuildContext context) {
    notificationsModel = createModel(context, () => NotificationsModel());
  }

  @override
  void dispose() {
    notificationsModel.dispose();
  }
}
