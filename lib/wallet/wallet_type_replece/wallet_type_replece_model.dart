import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wallet_type_replece_widget.dart' show WalletTypeRepleceWidget;
import 'package:flutter/material.dart';

class WalletTypeRepleceModel extends FlutterFlowModel<WalletTypeRepleceWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DocumentContractRow>? qureyDocumentContract;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ReplaceOutputRow>? queryReplaceOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? newChatAdmin;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? quryChatAdmin;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ReplaceOutputRow>? queryReplaceOutputCash;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReplaceOutputRow? newReplaceOutpute;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? newChatAdminCash;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? quryChatAdminCash;
  // Stores action output result for [Custom Action - createPayment] action in Button widget.
  dynamic createWalletTopupPayment;
  bool isDataUploading_paymentInvose = false;
  FFUploadedFile uploadedLocalFile_paymentInvose =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_paymentInvose = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ReplaceOutputRow? newOutput;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
  }
}
