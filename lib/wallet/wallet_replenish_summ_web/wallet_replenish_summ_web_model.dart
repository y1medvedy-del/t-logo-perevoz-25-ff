import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_replenish_summ_web_widget.dart'
    show WalletReplenishSummWebWidget;
import 'package:flutter/material.dart';

class WalletReplenishSummWebModel
    extends FlutterFlowModel<WalletReplenishSummWebWidget> {
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
