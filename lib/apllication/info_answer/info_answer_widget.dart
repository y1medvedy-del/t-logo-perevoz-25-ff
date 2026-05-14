import '/apllication/row_icon_text/row_icon_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_answer_model.dart';
export 'info_answer_model.dart';

class InfoAnswerWidget extends StatefulWidget {
  const InfoAnswerWidget({
    super.key,
    required this.idAnswer,
  });

  final int? idAnswer;

  @override
  State<InfoAnswerWidget> createState() => _InfoAnswerWidgetState();
}

class _InfoAnswerWidgetState extends State<InfoAnswerWidget> {
  late InfoAnswerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoAnswerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.markupCompany = await MarkupPraceTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().myCompany,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 16.0),
      child: Container(
        width: 700.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            FutureBuilder<List<AnswerRow>>(
              future: AnswerTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  widget.idAnswer,
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
                List<AnswerRow> containerAnswerRowList = snapshot.data!;

                final containerAnswerRow = containerAnswerRowList.isNotEmpty
                    ? containerAnswerRowList.first
                    : null;

                return Container(
                  width: 700.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xFFD0D5D8),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.rowIconTextModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: RowIconTextWidget(
                            icon: Icon(
                              FFIcons.kproperty1calendar,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            text1: 'Дата и время',
                            text2:
                                '${containerAnswerRow?.suggestedDate},  ${containerAnswerRow?.suggestedTime}',
                            iconInfo: false,
                            newPrace: false,
                            action: () async {},
                          ),
                        ),
                        FutureBuilder<List<AplicationRow>>(
                          future: AplicationTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              containerAnswerRow?.applicationId,
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
                            List<AplicationRow> rowIconTextAplicationRowList =
                                snapshot.data!;

                            final rowIconTextAplicationRow =
                                rowIconTextAplicationRowList.isNotEmpty
                                    ? rowIconTextAplicationRowList.first
                                    : null;

                            return wrapWithModel(
                              model: _model.rowIconTextModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: RowIconTextWidget(
                                icon: Icon(
                                  FFIcons.kproperty1Geo24,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                text1: 'Адрес склада',
                                text2: valueOrDefault<String>(
                                  containerAnswerRow?.street,
                                  'адрес',
                                ),
                                text3: '',
                                text4: functions.distantionStr(
                                    functions.distantionKM(
                                        rowIconTextAplicationRow?.lat,
                                        rowIconTextAplicationRow?.lon,
                                        containerAnswerRow?.lat,
                                        containerAnswerRow?.lon)),
                                iconInfo: false,
                                newPrace: false,
                                action: () async {},
                              ),
                            );
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(),
                                    child: Icon(
                                      FFIcons.kproperty1package,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Работы',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF667078),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      FutureBuilder<List<WorkAnswerRow>>(
                                        future: _model.workAnswer(
                                          requestFn: () =>
                                              WorkAnswerTable().queryRows(
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<WorkAnswerRow>
                                              listViewWorkAnswerRowList =
                                              snapshot.data!;

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewWorkAnswerRowList
                                                .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewWorkAnswerRow =
                                                  listViewWorkAnswerRowList[
                                                      listViewIndex];
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewWorkAnswerRow
                                                          .nameWork!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${(valueOrDefault<int>(
                                                                listViewWorkAnswerRow
                                                                            .newPrice !=
                                                                        null
                                                                    ? listViewWorkAnswerRow
                                                                        .newPrice
                                                                    : listViewWorkAnswerRow
                                                                        .price,
                                                                0,
                                                              ) + (valueOrDefault<int>(
                                                                    listViewWorkAnswerRow.newPrice !=
                                                                            null
                                                                        ? listViewWorkAnswerRow
                                                                            .newPrice
                                                                        : listViewWorkAnswerRow
                                                                            .price,
                                                                    0,
                                                                  ) * valueOrDefault<int>(
                                                                    _model
                                                                        .markupCompany
                                                                        ?.firstOrNull
                                                                        ?.procent,
                                                                    0,
                                                                  ) / 100)).toString()} ₽ x${listViewWorkAnswerRow.quantity?.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${((listViewWorkAnswerRow.quantity!) * (valueOrDefault<int>(
                                                                  listViewWorkAnswerRow
                                                                              .newPrice !=
                                                                          null
                                                                      ? listViewWorkAnswerRow
                                                                          .newPrice
                                                                      : listViewWorkAnswerRow
                                                                          .price,
                                                                  0,
                                                                ) + (valueOrDefault<int>(
                                                                      listViewWorkAnswerRow.newPrice !=
                                                                              null
                                                                          ? listViewWorkAnswerRow
                                                                              .newPrice
                                                                          : listViewWorkAnswerRow
                                                                              .price,
                                                                      0,
                                                                    ) * valueOrDefault<int>(
                                                                      _model
                                                                          .markupCompany
                                                                          ?.firstOrNull
                                                                          ?.procent,
                                                                      0,
                                                                    ) / 100))).toString()} ₽',
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        wrapWithModel(
                          model: _model.rowIconTextModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: RowIconTextWidget(
                            icon: Icon(
                              FFIcons.kproperty1rubleSvgrepoCom11,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            text1: 'Сумма, предложенная складом',
                            text2: '${(valueOrDefault<int>(
                                  containerAnswerRow?.newPrice != null
                                      ? containerAnswerRow?.newPrice
                                      : containerAnswerRow?.price,
                                  0,
                                ) + (valueOrDefault<int>(
                                      containerAnswerRow?.newPrice != null
                                          ? containerAnswerRow?.newPrice
                                          : containerAnswerRow?.price,
                                      0,
                                    ) * valueOrDefault<int>(
                                      _model
                                          .markupCompany?.firstOrNull?.procent,
                                      0,
                                    ) / 100)).toString()} ₽',
                            iconInfo: false,
                            newPrace: false,
                            action: () async {},
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
