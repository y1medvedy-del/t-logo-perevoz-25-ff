import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'apllication5_widget.dart' show Apllication5Widget;
import 'package:flutter/material.dart';

class Apllication5Model extends FlutterFlowModel<Apllication5Widget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in apllication_5 widget.
  List<DocumentContractRow>? contract;
  // Stores action output result for [Backend Call - Query Rows] action in apllication_5 widget.
  List<WalletsRow>? wallet;
  // Model for a_Cap_cancel component.
  late ACapCancelModel aCapCancelModel;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<AplicationRow>? editTypePaymentApplication;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AplicationRow>? application;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<WalletsRow>? queryWaletsAction;
  // Stores action output result for [Custom Action - callWalletPayment] action in Button widget.
  String? callWalletPayment;
  // Stores action output result for [Custom Action - createCashTransactions] action in Button widget.
  String? createCashTransaction;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DocumentContractRow>? queryContractAction;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ApplicationContentRow>? paymentInvoiceApplication;
  // Stores action output result for [Custom Action - createPayment] action in Button widget.
  dynamic paymentUrlJson;

  @override
  void initState(BuildContext context) {
    aCapCancelModel = createModel(context, () => ACapCancelModel());
  }

  @override
  void dispose() {
    aCapCancelModel.dispose();
  }
}
