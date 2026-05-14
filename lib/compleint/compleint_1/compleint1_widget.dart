import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/reviews/row_text_icon/row_text_icon_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'compleint1_model.dart';
export 'compleint1_model.dart';

class Compleint1Widget extends StatefulWidget {
  const Compleint1Widget({
    super.key,
    required this.applicationID,
  });

  final int? applicationID;

  static String routeName = 'compleint_1';
  static String routePath = 'compleint1';

  @override
  State<Compleint1Widget> createState() => _Compleint1WidgetState();
}

class _Compleint1WidgetState extends State<Compleint1Widget> {
  late Compleint1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Compleint1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.returneMenuModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ReturneMenuWidget(
                            text: 'Жалоба',
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 2.0, 24.0, 0.0),
                            child: Container(
                              width: 700.0,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<List<ComplaintReasonsRow>>(
                                future: ComplaintReasonsTable().queryRows(
                                  queryFn: (q) => q,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 10.0,
                                        height: 10.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ComplaintReasonsRow>
                                      listViewComplaintReasonsRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewComplaintReasonsRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewComplaintReasonsRow =
                                          listViewComplaintReasonsRowList[
                                              listViewIndex];
                                      return RowTextIconWidget(
                                        key: Key(
                                            'Keyth2_${listViewIndex}_of_${listViewComplaintReasonsRowList.length}'),
                                        text: listViewComplaintReasonsRow.text!,
                                        action: () async {
                                          context.pushNamed(
                                            Compleint2Widget.routeName,
                                            queryParameters: {
                                              'complainReasons': serializeParam(
                                                listViewComplaintReasonsRow
                                                    .text,
                                                ParamType.String,
                                              ),
                                              'applicationID': serializeParam(
                                                widget.applicationID,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
