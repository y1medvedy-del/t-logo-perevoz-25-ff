import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'application12_edit_address_widget.dart'
    show Application12EditAddressWidget;
import 'package:flutter/material.dart';

class Application12EditAddressModel
    extends FlutterFlowModel<Application12EditAddressWidget> {
  ///  Local state fields for this page.

  LatLng? geo;

  bool conteinerAddress = false;

  String? applicationStreet;

  String? applicationHause;

  double? lat;

  double? lon;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (addressCarrierTextFild)] action in TextField widget.
  ApiCallResponse? adrress;
  // Stores action output result for [Backend Call - API (geo)] action in IconButton widget.
  ApiCallResponse? apiResultisGeo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future<int?> asdfg(BuildContext context) async {
    return null;
  }
}
