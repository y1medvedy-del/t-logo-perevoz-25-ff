import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_replenish_summ_app_widget.dart'
    show WalletReplenishSummAppWidget;
import 'package:flutter/material.dart';

class WalletReplenishSummAppModel
    extends FlutterFlowModel<WalletReplenishSummAppWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
