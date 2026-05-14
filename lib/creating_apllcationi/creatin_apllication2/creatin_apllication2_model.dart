import '/backend/api_requests/api_calls.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creatin_apllication2_widget.dart' show CreatinApllication2Widget;
import 'package:flutter/material.dart';

class CreatinApllication2Model
    extends FlutterFlowModel<CreatinApllication2Widget> {
  ///  Local state fields for this page.

  LatLng? geo;

  /// список улиц
  bool conteinerAddressTextFildStreet = false;

  String? applicationStreet;

  String? applicationHause;

  bool conteinerAddressGeo = false;

  int? stage = 1;

  bool conteinerAddressHouse = false;

  double? lat;

  double? lon;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close component.
  late ACapCloseModel aCapCloseModel;
  // Stores action output result for [Backend Call - API (geo)] action in IconButton widget.
  ApiCallResponse? apiResultisGeo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (addressCarrierTextFild)] action in TextField widget.
  ApiCallResponse? adrress;

  @override
  void initState(BuildContext context) {
    aCapCloseModel = createModel(context, () => ACapCloseModel());
  }

  @override
  void dispose() {
    aCapCloseModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }
}
