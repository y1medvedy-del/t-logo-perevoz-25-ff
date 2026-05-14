import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'wallet_successfully_model.dart';
export 'wallet_successfully_model.dart';

class WalletSuccessfullyWidget extends StatefulWidget {
  const WalletSuccessfullyWidget({super.key});

  static String routeName = 'wallet_successfully';
  static String routePath = 'payment-success';

  @override
  State<WalletSuccessfullyWidget> createState() =>
      _WalletSuccessfullyWidgetState();
}

class _WalletSuccessfullyWidgetState extends State<WalletSuccessfullyWidget> {
  late WalletSuccessfullyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletSuccessfullyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkWalletTopupPayment1 = await actions.checkPayment(
        FFAppState().lastPaymentPurpose,
        FFAppState().lastPaymentId,
        FFAppState().lastOrderId,
        FFAppState().lastTargetType,
        FFAppState().lastTargetId,
      );
      _model.paymentStatus = getJsonField(
        _model.checkWalletTopupPayment1,
        r'''$.status''',
      ).toString();
      _model.isApplied = getJsonField(
        _model.checkWalletTopupPayment1,
        r'''$.isApplied''',
      );
      _model.paymentProgress = _model.paymentProgress! + 0.2;
      safeSetState(() {});
      if (_model.isApplied == true) {
        _model.isCheckingPayment = false;
        safeSetState(() {});
        return;
      } else {
        await Future.delayed(
          Duration(
            milliseconds: 3000,
          ),
        );
        _model.checkWalletTopupPayment2 = await actions.checkPayment(
          FFAppState().lastPaymentPurpose,
          FFAppState().lastPaymentId,
          FFAppState().lastOrderId,
          FFAppState().lastTargetType,
          FFAppState().lastTargetId,
        );
        _model.paymentStatus = getJsonField(
          _model.checkWalletTopupPayment2,
          r'''$.status''',
        ).toString();
        _model.isApplied = getJsonField(
          _model.checkWalletTopupPayment2,
          r'''$.isApplied''',
        );
        _model.paymentProgress = _model.paymentProgress! + 0.2;
        safeSetState(() {});
        if (_model.isApplied == true) {
          _model.isCheckingPayment = false;
          safeSetState(() {});
          return;
        } else {
          await Future.delayed(
            Duration(
              milliseconds: 3000,
            ),
          );
          _model.checkWalletTopupPayment3 = await actions.checkPayment(
            FFAppState().lastPaymentPurpose,
            FFAppState().lastPaymentId,
            FFAppState().lastOrderId,
            FFAppState().lastTargetType,
            FFAppState().lastTargetId,
          );
          _model.paymentStatus = getJsonField(
            _model.checkWalletTopupPayment3,
            r'''$.status''',
          ).toString();
          _model.isApplied = getJsonField(
            _model.checkWalletTopupPayment3,
            r'''$.isApplied''',
          );
          safeSetState(() {});
          if (_model.isApplied == true) {
            _model.isCheckingPayment = false;
            safeSetState(() {});
            return;
          } else {
            await Future.delayed(
              Duration(
                milliseconds: 3000,
              ),
            );
          }

          if ((_model.paymentStatus == 'failed') ||
              (_model.paymentStatus == 'canceled') ||
              (_model.paymentStatus == 'apply_failed')) {
            context.pushNamed(WalletPaymentFailWidget.routeName);
          } else {
            _model.isCheckingPayment = false;
            safeSetState(() {});
          }
        }
      }
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Builder(
              builder: (context) {
                if (_model.isApplied == true) {
                  return Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFDEF8DA),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                color: FlutterFlowTheme.of(context).success,
                                size: 60.0,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Оплата прошла успешно',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if ((FFAppState().lastPaymentPurpose ==
                                            'wallet_topup') ||
                                        (FFAppState().lastPaymentPurpose ==
                                            'fine_payment'))
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              WalletWidget.routeName);
                                        },
                                        text: 'К кошельку',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    if (FFAppState().lastPaymentPurpose ==
                                        'order_payment')
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.queryApplication =
                                              await AplicationTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              FFAppState().lastTargetId,
                                            ),
                                          );

                                          context.pushNamed(
                                            Apllication6Widget.routeName,
                                            queryParameters: {
                                              'applicationID': serializeParam(
                                                FFAppState().lastTargetId,
                                                ParamType.int,
                                              ),
                                              'answerID': serializeParam(
                                                _model.queryApplication
                                                    ?.firstOrNull?.answer,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'К заявке',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                  ],
                                ),
                                Flexible(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context
                                          .pushNamed(General1Widget.routeName);
                                    },
                                    text: 'На главную',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (_model.isCheckingPayment) {
                  return Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Lottie.asset(
                            'assets/jsons/flutterflow_loader_blue.json',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.contain,
                            frameRate: FrameRate(100.0),
                            animate: true,
                          ),
                        ),
                        Text(
                          'Оплата проверяется...',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent2,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.access_time_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 60.0,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Платёж обрабатывается...',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if ((FFAppState().lastPaymentPurpose ==
                                            'wallet_topup') ||
                                        (FFAppState().lastPaymentPurpose ==
                                            'fine_payment'))
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              WalletWidget.routeName);
                                        },
                                        text: 'К кошельку',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    if (FFAppState().lastPaymentPurpose ==
                                        'order_payment')
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.queryApplication2 =
                                              await AplicationTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              FFAppState().lastTargetId,
                                            ),
                                          );

                                          context.pushNamed(
                                            Apllication6Widget.routeName,
                                            queryParameters: {
                                              'applicationID': serializeParam(
                                                FFAppState().lastTargetId,
                                                ParamType.int,
                                              ),
                                              'answerID': serializeParam(
                                                _model.queryApplication2
                                                    ?.firstOrNull?.answer,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'К заявке',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                  ],
                                ),
                                Flexible(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          WalletSuccessfullyWidget.routeName);
                                    },
                                    text: 'Проверить оплату',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
