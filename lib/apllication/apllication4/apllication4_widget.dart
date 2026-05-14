import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_content_and_doc/application_content_and_doc_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/aswer_work/aswer_work_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_message_and_call_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reviews/review_button/review_button_widget.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'apllication4_model.dart';
export 'apllication4_model.dart';

class Apllication4Widget extends StatefulWidget {
  const Apllication4Widget({
    super.key,
    required this.applicationID,
    required this.answerID,
  });

  final int? applicationID;
  final int? answerID;

  static String routeName = 'apllication4';
  static String routePath = 'apllication4';

  @override
  State<Apllication4Widget> createState() => _Apllication4WidgetState();
}

class _Apllication4WidgetState extends State<Apllication4Widget> {
  late Apllication4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Apllication4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          _model.checkWalletTopupPayment = await actions.checkPayment(
            FFAppState().lastPaymentPurpose,
            FFAppState().lastPaymentId,
            FFAppState().lastOrderId,
            FFAppState().lastTargetType,
            FFAppState().lastTargetId,
          );
        }(),
      );
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: FutureBuilder<List<AplicationRow>>(
            future:
                (_model.requestCompleter ??= Completer<List<AplicationRow>>()
                      ..complete(AplicationTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          widget.applicationID,
                        ),
                      )))
                    .future,
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
              List<AplicationRow> columnAplicationRowList = snapshot.data!;

              final columnAplicationRow = columnAplicationRowList.isNotEmpty
                  ? columnAplicationRowList.first
                  : null;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.aCapCancelModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ACapCancelWidget(
                            applicationID: widget.applicationID!,
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.applicationStatusModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ApplicationStatusWidget(
                                    applicationID: widget.applicationID!,
                                    jobStatus: columnAplicationRow!.jobStatus!,
                                    paymentStatus:
                                        columnAplicationRow.paymentStatus!,
                                    action: (info) async {
                                      _model.info = info;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                if (_model.info)
                                  wrapWithModel(
                                    model: _model.infoApplicationModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InfoApplicationWidget(
                                      idApplication: widget.applicationID!,
                                      applicationDoc: columnAplicationRow,
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width >
                                                MediaQuery.sizeOf(context)
                                                    .height
                                            ? 122.0
                                            : 30.0,
                                        0.0,
                                      ),
                                      0.0,
                                      16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 16.0),
                                            child: Container(
                                              width: 700.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Исполнитель завершил работы',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  FutureBuilder<
                                                      List<PaymentInvoiceRow>>(
                                                    future:
                                                        PaymentInvoiceTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'application',
                                                        widget.applicationID,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<PaymentInvoiceRow>
                                                          containerPaymentInvoiceRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible: (columnAplicationRow
                                                                      .amount !=
                                                                  null) &&
                                                              (columnAplicationRow
                                                                      .paymentType ==
                                                                  'По счету') &&
                                                              ((containerPaymentInvoiceRowList
                                                                      .isNotEmpty) ==
                                                                  false),
                                                          child: Text(
                                                            'В ближайшеее время мы подготовим для вас счет на оплату',
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      16.0,
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
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .applicationContentAndDocModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                ApplicationContentAndDocWidget(
                                              idApplication:
                                                  widget.applicationID!,
                                              idAnswer: widget.answerID!,
                                              editingElements: false,
                                              applicationNumber:
                                                  columnAplicationRow.namber!,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.aswerWorkModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: AswerWorkWidget(
                                              idApplication:
                                                  widget.applicationID!,
                                              idAnswer: widget.answerID!,
                                              flag: false,
                                              creationAtApplication:
                                                  columnAplicationRow
                                                      .createdAt,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.reviewButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ReviewButtonWidget(
                                      idApplication: widget.applicationID!,
                                      applicationNumber:
                                          columnAplicationRow.namber!,
                                      executer: columnAplicationRow.executor!,
                                    ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 100.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 24.0, 24.0),
                    child: Container(
                      width: 700.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (!columnAplicationRow.isWorkAccepted!) {
                                    return Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          _model.answerQuery =
                                              await AnswerTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              widget.answerID,
                                            ),
                                          );
                                          await AplicationTable().update(
                                            data: {
                                              'is_work_accepted': true,
                                              'job status': 'Завершена',
                                              'amount': _model
                                                          .answerQuery
                                                          ?.firstOrNull
                                                          ?.newPrice !=
                                                      null
                                                  ? _model.answerQuery
                                                      ?.firstOrNull?.newPrice
                                                      ?.toDouble()
                                                  : _model.answerQuery
                                                      ?.firstOrNull?.price
                                                      ?.toDouble(),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.applicationID,
                                            ),
                                          );
                                          _model.urlDocApplicationBlanc =
                                              await actions
                                                  .createApplicationDocPdf(
                                            widget.applicationID!,
                                            'Blanc_3_step_${columnAplicationRow.namber}_${dateTimeFormat(
                                              "dd.MM.yyyy_h.mm",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            'blanc_application',
                                            true,
                                            true,
                                            true,
                                          );
                                          await ApplicationBlancDocTable()
                                              .insert({
                                            'application_id':
                                                widget.applicationID,
                                            'stamp_and_signature': 1,
                                            'name_doc':
                                                'Заявка (акт) на выполнение Погрузо-разгрузочных работ № ${columnAplicationRow.namber} от ${dateTimeFormat(
                                              "dd.MM.yyyy ",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            'link_doc':
                                                _model.urlDocApplicationBlanc,
                                          });
                                          if (columnAplicationRow
                                                  .paymentType ==
                                              'По счету') {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: CustomDialogWidget(
                                                        title:
                                                            'Счет подготавливается',
                                                        subtitle:
                                                            'Мы уже начали подготовку вашего счета. В ближайшее время вы его получите',
                                                        textBlueButton:
                                                            'Продолжить',
                                                        actionBlueButton:
                                                            (selectBlue) async {
                                                          context.pushNamed(
                                                              General1Widget
                                                                  .routeName);
                                                        },
                                                        actionWhiteButton:
                                                            (selectWhite) async {},
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            safeSetState(() {});
                                          }

                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        text: 'Подтвердить рабоы',
                                        options: FFButtonOptions(
                                          width: 700.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          Apllication5Widget.routeName,
                                          queryParameters: {
                                            'paymentType': serializeParam(
                                              columnAplicationRow.paymentType,
                                              ParamType.String,
                                            ),
                                            'applicationID': serializeParam(
                                              widget.applicationID,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'Оплатить',
                                      options: FFButtonOptions(
                                        width: 700.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.buttonMessageAndCallModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonMessageAndCallWidget(
                              idChat: valueOrDefault<int>(
                                columnAplicationRow.chatID,
                                0,
                              ),
                              userExecuter: columnAplicationRow.executor!,
                              idApplication: widget.applicationID!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
