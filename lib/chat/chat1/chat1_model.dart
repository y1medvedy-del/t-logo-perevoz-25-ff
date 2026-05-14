import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/general/mobile_menu/mobile_menu_widget.dart';
import '/general/notifications/notifications_widget.dart';
import 'dart:async';
import '/index.dart';
import 'chat1_widget.dart' show Chat1Widget;
import 'package:flutter/material.dart';

class Chat1Model extends FlutterFlowModel<Chat1Widget> {
  ///  Local state fields for this page.
  /// обновление страницы
  bool refresh = false;

  ///  State fields for stateful widgets in this page.

  Stream<List<NotificationsRow>>? containerSupabaseStream;
  // Model for menuPC component.
  late MenuPCModel menuPCModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? cahatAdmin;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? insertChat;
  // Model for notifications component.
  late NotificationsModel notificationsModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for mobileMenu component.
  late MobileMenuModel mobileMenuModel;

  @override
  void initState(BuildContext context) {
    menuPCModel = createModel(context, () => MenuPCModel());
    notificationsModel1 = createModel(context, () => NotificationsModel());
    mobileMenuModel = createModel(context, () => MobileMenuModel());
  }

  @override
  void dispose() {
    menuPCModel.dispose();
    notificationsModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    mobileMenuModel.dispose();
  }
}
