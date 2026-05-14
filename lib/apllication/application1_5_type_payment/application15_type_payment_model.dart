import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'application15_type_payment_widget.dart'
    show Application15TypePaymentWidget;
import 'package:flutter/material.dart';

class Application15TypePaymentModel
    extends FlutterFlowModel<Application15TypePaymentWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  int stage = 6;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in application1_5_TypePayment widget.
  List<DocumentContractRow>? contract;
  // Stores action output result for [Backend Call - Query Rows] action in application1_5_TypePayment widget.
  List<WalletsRow>? wallet;
  // Stores action output result for [Backend Call - Query Rows] action in type_payment widget.
  List<CompanyRow>? myCompanyQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
