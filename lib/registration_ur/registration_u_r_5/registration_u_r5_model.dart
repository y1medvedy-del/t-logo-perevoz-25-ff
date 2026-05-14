import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_u_r5_widget.dart' show RegistrationUR5Widget;
import 'package:flutter/material.dart';

class RegistrationUR5Model extends FlutterFlowModel<RegistrationUR5Widget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for bik widget.
  FocusNode? bikFocusNode;
  TextEditingController? bikTextController;
  String? Function(BuildContext, String?)? bikTextControllerValidator;
  // Stores action output result for [Backend Call - API (bikBank)] action in bik widget.
  ApiCallResponse? bikBankApi;
  // State field(s) for name_bank widget.
  FocusNode? nameBankFocusNode;
  TextEditingController? nameBankTextController;
  String? Function(BuildContext, String?)? nameBankTextControllerValidator;
  // State field(s) for korespondent_accaunt widget.
  FocusNode? korespondentAccauntFocusNode;
  TextEditingController? korespondentAccauntTextController;
  String? Function(BuildContext, String?)?
      korespondentAccauntTextControllerValidator;
  // State field(s) for payment_accaunt widget.
  FocusNode? paymentAccauntFocusNode;
  TextEditingController? paymentAccauntTextController;
  String? Function(BuildContext, String?)?
      paymentAccauntTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<CompanyRow>? action;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bikFocusNode?.dispose();
    bikTextController?.dispose();

    nameBankFocusNode?.dispose();
    nameBankTextController?.dispose();

    korespondentAccauntFocusNode?.dispose();
    korespondentAccauntTextController?.dispose();

    paymentAccauntFocusNode?.dispose();
    paymentAccauntTextController?.dispose();
  }
}
