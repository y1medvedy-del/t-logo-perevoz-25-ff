import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_successfully_widget.dart' show WalletSuccessfullyWidget;
import 'package:flutter/material.dart';

class WalletSuccessfullyModel
    extends FlutterFlowModel<WalletSuccessfullyWidget> {
  ///  Local state fields for this page.
  /// Статус оплаты
  String? paymentStatus;

  bool isCheckingPayment = true;

  /// процент закгрузки progres bar
  double? paymentProgress = 0.0;

  bool? isApplied;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkPayment] action in wallet_successfully widget.
  dynamic checkWalletTopupPayment1;
  // Stores action output result for [Custom Action - checkPayment] action in wallet_successfully widget.
  dynamic checkWalletTopupPayment2;
  // Stores action output result for [Custom Action - checkPayment] action in wallet_successfully widget.
  dynamic checkWalletTopupPayment3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AplicationRow>? queryApplication;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AplicationRow>? queryApplication2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
