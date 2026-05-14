import '/ananimus/menu_p_c_ananimus/menu_p_c_ananimus_widget.dart';
import '/ananimus/mobile_menu_ananimus/mobile_menu_ananimus_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'chat1_ananimus_widget.dart' show Chat1AnanimusWidget;
import 'package:flutter/material.dart';

class Chat1AnanimusModel extends FlutterFlowModel<Chat1AnanimusWidget> {
  ///  Local state fields for this page.
  /// обновление страницы
  bool refresh = false;

  ///  State fields for stateful widgets in this page.

  Stream<List<NotificationsRow>>? containerSupabaseStream;
  // Model for menuPC_Ananimus component.
  late MenuPCAnanimusModel menuPCAnanimusModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for mobileMenu_Ananimus component.
  late MobileMenuAnanimusModel mobileMenuAnanimusModel;

  @override
  void initState(BuildContext context) {
    menuPCAnanimusModel = createModel(context, () => MenuPCAnanimusModel());
    mobileMenuAnanimusModel =
        createModel(context, () => MobileMenuAnanimusModel());
  }

  @override
  void dispose() {
    menuPCAnanimusModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    mobileMenuAnanimusModel.dispose();
  }
}
