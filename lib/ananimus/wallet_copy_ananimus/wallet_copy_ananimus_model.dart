import '/ananimus/menu_p_c_ananimus/menu_p_c_ananimus_widget.dart';
import '/ananimus/mobile_menu_ananimus/mobile_menu_ananimus_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_copy_ananimus_widget.dart' show WalletCopyAnanimusWidget;
import 'package:flutter/material.dart';

class WalletCopyAnanimusModel
    extends FlutterFlowModel<WalletCopyAnanimusWidget> {
  ///  Local state fields for this page.

  DateTime? date1;

  DateTime? date2;

  ///  State fields for stateful widgets in this page.

  // Model for menuPC_Ananimus component.
  late MenuPCAnanimusModel menuPCAnanimusModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  DateTime? datePicked1;
  DateTime? datePicked2;
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
    tabBarController?.dispose();
    mobileMenuAnanimusModel.dispose();
  }
}
