import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'registration_u_r3_widget.dart' show RegistrationUR3Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationUR3Model extends FlutterFlowModel<RegistrationUR3Widget> {
  ///  Local state fields for this page.

  bool offer = false;

  FFUploadedFile? docFile;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for phone_company widget.
  FocusNode? phoneCompanyFocusNode;
  TextEditingController? phoneCompanyTextController;
  late MaskTextInputFormatter phoneCompanyMask;
  String? Function(BuildContext, String?)? phoneCompanyTextControllerValidator;
  // State field(s) for website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;
  bool isDataUploading_docRecvisition = false;
  FFUploadedFile uploadedLocalFile_docRecvisition =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_docFileSupa = false;
  FFUploadedFile uploadedLocalFile_docFileSupa =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_docFileSupa = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneCompanyFocusNode?.dispose();
    phoneCompanyTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();
  }
}
