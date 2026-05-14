import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_u_r4_i_p_widget.dart' show RegistrationUR4IPWidget;
import 'package:flutter/material.dart';

class RegistrationUR4IPModel extends FlutterFlowModel<RegistrationUR4IPWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for INN widget.
  FocusNode? innFocusNode;
  TextEditingController? innTextController;
  String? Function(BuildContext, String?)? innTextControllerValidator;
  // Stores action output result for [Backend Call - API (requestCompany)] action in INN widget.
  ApiCallResponse? requisitesCompany;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for OGRNIP widget.
  FocusNode? ogrnipFocusNode;
  TextEditingController? ogrnipTextController;
  String? Function(BuildContext, String?)? ogrnipTextControllerValidator;
  // State field(s) for ur_address widget.
  FocusNode? urAddressFocusNode;
  TextEditingController? urAddressTextController;
  String? Function(BuildContext, String?)? urAddressTextControllerValidator;
  // State field(s) for fact_address widget.
  FocusNode? factAddressFocusNode;
  TextEditingController? factAddressTextController;
  String? Function(BuildContext, String?)? factAddressTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<DocumentRow>? doc2;
  bool isDataUploading_uploadDoc = false;
  FFUploadedFile uploadedLocalFile_uploadDoc =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDoc = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    innFocusNode?.dispose();
    innTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    ogrnipFocusNode?.dispose();
    ogrnipTextController?.dispose();

    urAddressFocusNode?.dispose();
    urAddressTextController?.dispose();

    factAddressFocusNode?.dispose();
    factAddressTextController?.dispose();
  }
}
