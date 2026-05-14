import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/row_next_text_icon/row_next_text_icon_widget.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'profil1_widget.dart' show Profil1Widget;
import 'package:flutter/material.dart';

class Profil1Model extends FlutterFlowModel<Profil1Widget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatRow>? queryChatAdmin;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatRow? newChatAdmin;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel1;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel2;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel3;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel4;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel5;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel6;
  // Stores action output result for [Backend Call - Query Rows] action in row_next_text_icon widget.
  List<CompanyRow>? queryCompany;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel7;
  // Model for row_next_text_icon component.
  late RowNextTextIconModel rowNextTextIconModel8;

  /// Query cache managers for this widget.

  final _companyManager = FutureRequestManager<List<CompanyRow>>();
  Future<List<CompanyRow>> company({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CompanyRow>> Function() requestFn,
  }) =>
      _companyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompanyCache() => _companyManager.clear();
  void clearCompanyCacheKey(String? uniqueKey) =>
      _companyManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
    rowNextTextIconModel1 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel2 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel3 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel4 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel5 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel6 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel7 = createModel(context, () => RowNextTextIconModel());
    rowNextTextIconModel8 = createModel(context, () => RowNextTextIconModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
    rowNextTextIconModel1.dispose();
    rowNextTextIconModel2.dispose();
    rowNextTextIconModel3.dispose();
    rowNextTextIconModel4.dispose();
    rowNextTextIconModel5.dispose();
    rowNextTextIconModel6.dispose();
    rowNextTextIconModel7.dispose();
    rowNextTextIconModel8.dispose();

    /// Dispose query cache managers for this widget.

    clearCompanyCache();
  }
}
