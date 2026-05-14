import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'info_work_widget.dart' show InfoWorkWidget;
import 'package:flutter/material.dart';

class InfoWorkModel extends FlutterFlowModel<InfoWorkWidget> {
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearWorkAnswerCache();
  }
}
