import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'application18_edit_drive_widget.dart' show Application18EditDriveWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Application18EditDriveModel
    extends FlutterFlowModel<Application18EditDriveWidget> {
  ///  Local state fields for this page.

  int stage = 5;

  String surnameDriver = ' ';

  String nameDriver = ' ';

  String? patronymicDriver = '';

  String? phoneDriver = '';

  String? nameCar = '';

  String? namberCar = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for contact_phone widget.
  FocusNode? contactPhoneFocusNode;
  TextEditingController? contactPhoneTextController;
  late MaskTextInputFormatter contactPhoneMask;
  String? Function(BuildContext, String?)? contactPhoneTextControllerValidator;
  // State field(s) for gos_namber widget.
  FocusNode? gosNamberFocusNode;
  TextEditingController? gosNamberTextController;
  String? Function(BuildContext, String?)? gosNamberTextControllerValidator;
  String? _gosNamberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Формат: А111АА77';
    }

    if (!RegExp('^[АВЕКМНОРСТУХ]{1}\\d{3}[АВЕКМНОРСТУХ]{2}\\d{2,3}\$')
        .hasMatch(val)) {
      return 'Формат: А111АА77';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AplicationRow>? applicationQuery;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AplicationNameCompanyRow>? queryApplication;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? cahatAdmin;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SettingsRow>? setting;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? insertChat;

  @override
  void initState(BuildContext context) {
    gosNamberTextControllerValidator = _gosNamberTextControllerValidator;
  }

  @override
  void dispose() {
    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    patronymicFocusNode?.dispose();
    patronymicTextController?.dispose();

    contactPhoneFocusNode?.dispose();
    contactPhoneTextController?.dispose();

    gosNamberFocusNode?.dispose();
    gosNamberTextController?.dispose();
  }
}
