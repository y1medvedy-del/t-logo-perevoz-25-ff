import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_u_r2_widget.dart' show RegistrationUR2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationUR2Model extends FlutterFlowModel<RegistrationUR2Widget> {
  ///  Local state fields for this page.

  bool owner = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataAvatar = false;
  FFUploadedFile uploadedLocalFile_uploadDataAvatar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataAvatar = '';

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for patronymic widget.
  FocusNode? patronymicFocusNode;
  TextEditingController? patronymicTextController;
  String? Function(BuildContext, String?)? patronymicTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  late MaskTextInputFormatter phoneMask;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserRow>? createUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CompanyRow? newCompany;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CompanyRow>? company;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    patronymicFocusNode?.dispose();
    patronymicTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
