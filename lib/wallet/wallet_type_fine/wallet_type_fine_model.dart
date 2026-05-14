import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_type_fine_widget.dart' show WalletTypeFineWidget;
import 'package:flutter/material.dart';

class WalletTypeFineModel extends FlutterFlowModel<WalletTypeFineWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  /// флаг активного действия защищает от двойного нажатия на кнопку оплатить
  bool isSubmittingFinePayment = false;

  /// nbg оплаты для кастомного действия
  String? paymentMethod;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in wallet_type_fine widget.
  List<DocumentContractRow>? contract;
  // Stores action output result for [Backend Call - Query Rows] action in wallet_type_fine widget.
  List<WalletsRow>? wallet;
  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // Stores action output result for [Custom Action - createFinePaymentRequest] action in Button widget.
  dynamic createFinePaymentRequest;
  // Stores action output result for [Custom Action - createPayment] action in Button widget.
  dynamic createPayment;
  // Stores action output result for [Custom Action - applyFinePaymentRequest] action in Button widget.
  dynamic applyFinePaymentReguest;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
