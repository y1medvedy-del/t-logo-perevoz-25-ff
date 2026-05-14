import '/apllication/row_icon_text/row_icon_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'info_answer_widget.dart' show InfoAnswerWidget;
import 'package:flutter/material.dart';

class InfoAnswerModel extends FlutterFlowModel<InfoAnswerWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in info_answer widget.
  List<MarkupPraceRow>? markupCompany;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel1;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel2;
  // Model for row_icon_text component.
  late RowIconTextModel rowIconTextModel3;

  /// Query cache managers for this widget.

  final _workAnswerManager = FutureRequestManager<List<WorkAnswerRow>>();
  Future<List<WorkAnswerRow>> workAnswer({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WorkAnswerRow>> Function() requestFn,
  }) =>
      _workAnswerManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWorkAnswerCache() => _workAnswerManager.clear();
  void clearWorkAnswerCacheKey(String? uniqueKey) =>
      _workAnswerManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    rowIconTextModel1 = createModel(context, () => RowIconTextModel());
    rowIconTextModel2 = createModel(context, () => RowIconTextModel());
    rowIconTextModel3 = createModel(context, () => RowIconTextModel());
  }

  @override
  void dispose() {
    rowIconTextModel1.dispose();
    rowIconTextModel2.dispose();
    rowIconTextModel3.dispose();

    /// Dispose query cache managers for this widget.

    clearWorkAnswerCache();
  }
}
