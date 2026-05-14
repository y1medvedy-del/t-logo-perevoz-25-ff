import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication6_widget.dart' show CreatinApllication6Widget;
import 'package:flutter/material.dart';

class CreatinApllication6Model
    extends FlutterFlowModel<CreatinApllication6Widget> {
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
  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
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
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? insertChat;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SettingsRow>? setting;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? cahatAdmin;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
    gosNamberTextControllerValidator = _gosNamberTextControllerValidator;
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
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
