import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/notifications/notifications_widget.dart';
import 'mobile_menu_widget.dart' show MobileMenuWidget;
import 'package:flutter/material.dart';

class MobileMenuModel extends FlutterFlowModel<MobileMenuWidget> {
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
