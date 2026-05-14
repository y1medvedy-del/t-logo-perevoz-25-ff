import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'application_content_and_doc_widget.dart'
    show ApplicationContentAndDocWidget;
import 'package:flutter/material.dart';

class ApplicationContentAndDocModel
    extends FlutterFlowModel<ApplicationContentAndDocWidget> {
  ///  Local state fields for this component.

  String? nameDoc;

  /// обнавленный json данными покупателя после кастом диалога
  dynamic jsonInfo;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CompanyRow>? companyClient;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PaymentInvoiceRow>? queryPaymentInvoiceSing;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ActWorkRow>? queryActWorkSing;
  // Stores action output result for [Custom Action - simgGeneratePaymentUpdFlutter] action in Button widget.
  String? singUpdFile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
