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
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apllication6_model.dart';
export 'apllication6_model.dart';

class Apllication6Widget extends StatefulWidget {
  const Apllication6Widget({
    super.key,
    required this.applicationID,
    required this.answerID,
  });

  final int? applicationID;
  final int? answerID;

  static String routeName = 'apllication_6';
  static String routePath = 'apllication6';

  @override
  State<Apllication6Widget> createState() => _Apllication6WidgetState();
}

class _Apllication6WidgetState extends State<Apllication6Widget> {
  late Apllication6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Apllication6Model());

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
                                      0.0),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Исполнитель завершил работы',
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
                                            updateOnChange: true,
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
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Container(
                      width: 700.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(General1Widget.routeName);
                                  },
                                  text: 'На главную',
                                  options: FFButtonOptions(
                                    width: 700.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            if ((columnAplicationRow.jobStatus != 'Создана') &&
                                functions.isLessThanTwoDays(
                                    columnAplicationRow.paymentDate,
                                    FFAppState()
                                        .mySettings
                                        .daysToHideContacts
                                        .toString())!)
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
                  ),
                ].divide(SizedBox(height: 16.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
