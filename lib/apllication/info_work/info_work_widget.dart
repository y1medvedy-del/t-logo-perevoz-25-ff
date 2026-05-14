import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'info_work_model.dart';
export 'info_work_model.dart';

class InfoWorkWidget extends StatefulWidget {
  const InfoWorkWidget({
    super.key,
    required this.idAnswer,
    int? markup,
  }) : this.markup = markup ?? 0;

  final int? idAnswer;

  /// наценка для перевозщика
  final int markup;

  @override
  State<InfoWorkWidget> createState() => _InfoWorkWidgetState();
}

class _InfoWorkWidgetState extends State<InfoWorkWidget> {
  late InfoWorkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoWorkModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 30.0),
      child: FutureBuilder<List<WorkAnswerRow>>(
        future: _model.workAnswer(
          requestFn: () => WorkAnswerTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'answer_id',
                  widget.idAnswer,
                )
                .not(
                  'quantity',
                  'is',
                  null,
                )
                .order('id', ascending: true),
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<WorkAnswerRow> containerWorkAnswerRowList = snapshot.data!;

          return Container(
            width: 700.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: 700.0,
              child: Stack(
                children: [
                  Container(
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xFFD0D5D8),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FFIcons.kproperty124,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Работы',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final containerVar =
                                      containerWorkAnswerRowList.toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: containerVar.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 5.0),
                                    itemBuilder: (context, containerVarIndex) {
                                      final containerVarItem =
                                          containerVar[containerVarIndex];
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: containerVarIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .accent3
                                              : FlutterFlowTheme.of(context)
                                                  .accent2,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 5.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                containerVarItem.nameWork!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      '${(valueOrDefault<int>(
                                                            containerVarItem
                                                                        .newPrice !=
                                                                    null
                                                                ? valueOrDefault<
                                                                    int>(
                                                                    containerVarItem
                                                                        .newPrice,
                                                                    0,
                                                                  )
                                                                : valueOrDefault<
                                                                    int>(
                                                                    containerVarItem
                                                                        .price,
                                                                    0,
                                                                  ),
                                                            0,
                                                          ) + (valueOrDefault<int>(
                                                                containerVarItem
                                                                            .newPrice !=
                                                                        null
                                                                    ? valueOrDefault<
                                                                        int>(
                                                                        containerVarItem
                                                                            .newPrice,
                                                                        0,
                                                                      )
                                                                    : valueOrDefault<
                                                                        int>(
                                                                        containerVarItem
                                                                            .price,
                                                                        0,
                                                                      ),
                                                                0,
                                                              ) * widget.markup / 100)).toString()} ₽ x${containerVarItem.quantity?.toString()}',
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      ((containerVarItem
                                                                  .quantity!) *
                                                              (valueOrDefault<
                                                                      int>(
                                                                    containerVarItem.newPrice !=
                                                                            null
                                                                        ? valueOrDefault<
                                                                            int>(
                                                                            containerVarItem.newPrice,
                                                                            0,
                                                                          )
                                                                        : valueOrDefault<
                                                                            int>(
                                                                            containerVarItem.price,
                                                                            0,
                                                                          ),
                                                                    0,
                                                                  ) +
                                                                  (valueOrDefault<
                                                                          int>(
                                                                        containerVarItem.newPrice !=
                                                                                null
                                                                            ? valueOrDefault<int>(
                                                                                containerVarItem.newPrice,
                                                                                0,
                                                                              )
                                                                            : valueOrDefault<int>(
                                                                                containerVarItem.price,
                                                                                0,
                                                                              ),
                                                                        0,
                                                                      ) *
                                                                      widget
                                                                          .markup /
                                                                      100)))
                                                          .toString(),
                                                      '0',
                                                    )} ₽',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
