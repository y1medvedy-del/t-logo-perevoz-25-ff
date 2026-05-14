import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/wallet/a_cap_close_filter/a_cap_close_filter_widget.dart';
import '/index.dart';
import 'wallet_filter_widget.dart' show WalletFilterWidget;
import 'package:flutter/material.dart';

class WalletFilterModel extends FlutterFlowModel<WalletFilterWidget> {
  ///  Local state fields for this page.

  DateTime? date1;

  DateTime? date2;

  DateTime? endDate;

  /// тип оплаты переменная страницы
  String? tapePaymentState;

  /// тип операции для фильтра
  String? tapeOperation;

  ///  State fields for stateful widgets in this page.

  // Model for a_Cap_close_filter component.
  late ACapCloseFilterModel aCapCloseFilterModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {
    aCapCloseFilterModel = createModel(context, () => ACapCloseFilterModel());
  }

  @override
  void dispose() {
    aCapCloseFilterModel.dispose();
  }
}
