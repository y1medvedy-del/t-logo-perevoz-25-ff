import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_web_view_widget.dart' show WalletWebViewWidget;
import 'package:flutter/material.dart';

class WalletWebViewModel extends FlutterFlowModel<WalletWebViewWidget> {
  ///  Local state fields for this page.
  /// Статус оплаты
  String? paymentStatus;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
