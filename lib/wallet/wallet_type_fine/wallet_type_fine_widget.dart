import '/apllication/application_window_card_comission/application_window_card_comission_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/type_payment_widget.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wallet_type_fine_model.dart';
export 'wallet_type_fine_model.dart';

class WalletTypeFineWidget extends StatefulWidget {
  const WalletTypeFineWidget({
    super.key,
    required this.fine,
  });

  final int? fine;

  static String routeName = 'wallet_type_fine';
  static String routePath = 'walletTypeFine';

  @override
  State<WalletTypeFineWidget> createState() => _WalletTypeFineWidgetState();
}

class _WalletTypeFineWidgetState extends State<WalletTypeFineWidget> {
  late WalletTypeFineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletTypeFineModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (_model.pyamentTypeSelect != null &&
              _model.pyamentTypeSelect != '') {
            _model.pyamentTypeSelect = _model.pyamentTypeSelect;
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.contract = await DocumentContractTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'company',
              FFAppState().myCompany,
            ),
          );
        }),
        Future(() async {
          _model.wallet = await WalletsTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'company_id',
              FFAppState().myCompany,
            ),
          );
        }),
      ]);
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

    return FutureBuilder<List<FineRow>>(
      future: FineTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.fine,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<FineRow> walletTypeFineFineRowList = snapshot.data!;

        final walletTypeFineFineRow = walletTypeFineFineRowList.isNotEmpty
            ? walletTypeFineFineRowList.first
            : null;

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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.pyamentTypeSelect = walletTypeFineFineRow?.typePayment;
                  safeSetState(() {});
                },
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.aCapCloseModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ACapCloseWidget(
                                  text: 'Оплата штрафа',
                                  creatinStage: 0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 0.0),
                                child: Container(
                                  width: 700.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  MediaQuery.sizeOf(context)
                                                      .height
                                              ? 58.0
                                              : 30.0,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: FutureBuilder<List<TypePaymentRow>>(
                                      future: TypePaymentTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'visible',
                                          true,
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
                                        List<TypePaymentRow>
                                            columnTypePaymentRowList =
                                            snapshot.data!;

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnTypePaymentRowList.length,
                                                (columnIndex) {
                                              final columnTypePaymentRow =
                                                  columnTypePaymentRowList[
                                                      columnIndex];
                                              return Builder(
                                                builder: (context) =>
                                                    TypePaymentWidget(
                                                  key: Key(
                                                      'Keysrk_${columnIndex}_of_${columnTypePaymentRowList.length}'),
                                                  title: columnTypePaymentRow
                                                      .name!,
                                                  variable:
                                                      _model.pyamentTypeSelect,
                                                  subtitle: () {
                                                    if (columnTypePaymentRow
                                                            .name ==
                                                        'По счету') {
                                                      return (_model.contract !=
                                                                  null &&
                                                              (_model.contract)!
                                                                  .isNotEmpty
                                                          ? 'Догогвор подписан'
                                                          : 'Требуется договор');
                                                    } else if (columnTypePaymentRow
                                                            .name ==
                                                        'Кошелёк') {
                                                      return 'Ваш баланс: ${_model.wallet?.firstOrNull?.currentBalance.toString()}₽';
                                                    } else if (columnTypePaymentRow
                                                            .name ==
                                                        'Карта') {
                                                      return 'Visa, Mastercard, MIR';
                                                    } else {
                                                      return ' ';
                                                    }
                                                  }(),
                                                  action: () async {
                                                    if (columnTypePaymentRow
                                                            .name ==
                                                        'Карта') {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    ApplicationWindowCardComissionWidget(
                                                                  action:
                                                                      () async {
                                                                    _model.pyamentTypeSelect =
                                                                        columnTypePaymentRow
                                                                            .name;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      _model.pyamentTypeSelect =
                                                          columnTypePaymentRow
                                                              .name;
                                                      _model.paymentMethod =
                                                          () {
                                                        if (columnTypePaymentRow
                                                                .name ==
                                                            'Кошелёк') {
                                                          return 'wallet';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'По счету') {
                                                          return 'invoice';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'Перевод / Наличные') {
                                                          return 'cash';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'Карта') {
                                                          return 'tbank_card';
                                                        } else {
                                                          return 'пусто';
                                                        }
                                                      }();
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.pyamentTypeSelect =
                                                          columnTypePaymentRow
                                                              .name;
                                                      _model.paymentMethod =
                                                          () {
                                                        if (columnTypePaymentRow
                                                                .name ==
                                                            'Кошелёк') {
                                                          return 'wallet';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'По счету') {
                                                          return 'invoice';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'Перевод / Наличные') {
                                                          return 'cash';
                                                        } else if (columnTypePaymentRow
                                                                .name ==
                                                            'Карта') {
                                                          return 'tbank_card';
                                                        } else {
                                                          return 'пусто';
                                                        }
                                                      }();
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                ),
                                              );
                                            }).divide(SizedBox(height: 16.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  0.0,
                                  24.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width >
                                            MediaQuery.sizeOf(context).height
                                        ? 58.0
                                        : 30.0,
                                    0.0,
                                  )),
                              child: FutureBuilder<List<WalletsRow>>(
                                future: WalletsTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'company_id',
                                    FFAppState().myCompany,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<WalletsRow> buttonWalletsRowList =
                                      snapshot.data!;

                                  final buttonWalletsRow =
                                      buttonWalletsRowList.isNotEmpty
                                          ? buttonWalletsRowList.first
                                          : null;

                                  return FFButtonWidget(
                                    onPressed: ((_model.pyamentTypeSelect ==
                                                    null ||
                                                _model.pyamentTypeSelect ==
                                                    '') ||
                                            _model.isSubmittingFinePayment)
                                        ? null
                                        : () async {
                                            _model.createFinePaymentRequest =
                                                await actions
                                                    .createFinePaymentRequest(
                                              widget.fine!,
                                              FFAppState().myID,
                                              _model.paymentMethod!,
                                              'system',
                                            );
                                            if (getJsonField(
                                              _model.createFinePaymentRequest,
                                              r'''$.success''',
                                            )) {
                                              if (_model.pyamentTypeSelect ==
                                                  'Карта') {
                                                _model.createPayment =
                                                    await actions.createPayment(
                                                  'fine_payment',
                                                  getJsonField(
                                                    _model
                                                        .createFinePaymentRequest,
                                                    r'''$.amount''',
                                                  ),
                                                  'fine',
                                                  widget.fine,
                                                );
                                                if (getJsonField(
                                                      _model.createPayment,
                                                      r'''$.paymentUrl''',
                                                    ) !=
                                                    null) {
                                                  FFAppState().lastOrderId =
                                                      getJsonField(
                                                    _model.createPayment,
                                                    r'''$.orderId''',
                                                  ).toString();
                                                  FFAppState().lastPaymentId =
                                                      getJsonField(
                                                    _model.createPayment,
                                                    r'''$.onlinePaymentId''',
                                                  ).toString();
                                                  FFAppState()
                                                          .lastPaymentPurpose =
                                                      'fine_payment';
                                                  FFAppState().lastTargetType =
                                                      'fine';
                                                  FFAppState().lastTargetId =
                                                      widget.fine!;
                                                  safeSetState(() {});
                                                  await launchURL(getJsonField(
                                                    _model.createPayment,
                                                    r'''$.paymentUrl''',
                                                  ).toString());

                                                  context.pushNamed(
                                                      WalletSuccessfullyWidget
                                                          .routeName);
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                CustomDialogWidget(
                                                              title:
                                                                  'Ошибка оплаты картой',
                                                              subtitle:
                                                                  'Не удалось создать ссылку на оплату. Попробуйте позже или выберите другой способ оплаты.',
                                                              textBlueButton:
                                                                  'В кошелёк',
                                                              textWhiteButton:
                                                                  'На главную',
                                                              actionBlueButton:
                                                                  (selectBlue) async {
                                                                context.pushNamed(
                                                                    WalletWidget
                                                                        .routeName);
                                                              },
                                                              actionWhiteButton:
                                                                  (selectWhite) async {
                                                                context.pushNamed(
                                                                    General1Widget
                                                                        .routeName);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                if (_model.paymentMethod ==
                                                    'wallet') {
                                                  _model.applyFinePaymentReguest =
                                                      await actions
                                                          .applyFinePaymentRequest(
                                                    getJsonField(
                                                      _model
                                                          .createFinePaymentRequest,
                                                      r'''$.paymentRequestId''',
                                                    ),
                                                    FFAppState().myID,
                                                  );
                                                  if (getJsonField(
                                                    _model
                                                        .applyFinePaymentReguest,
                                                    r'''$.success''',
                                                  )) {
                                                    context.pushNamed(
                                                        WalletSuccessfullyWidget
                                                            .routeName);
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  CustomDialogWidget(
                                                                title:
                                                                    'Не удалось провести оплату',
                                                                subtitle:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  getJsonField(
                                                                    _model
                                                                        .applyFinePaymentReguest,
                                                                    r'''$.error''',
                                                                  )?.toString(),
                                                                  'Оплата не выполнена. Проверьте баланс кошелька или попробуйте позже.',
                                                                ),
                                                                textBlueButton:
                                                                    'В кошелёк',
                                                                textWhiteButton:
                                                                    'На главную',
                                                                actionBlueButton:
                                                                    (selectBlue) async {
                                                                  context.pushNamed(
                                                                      WalletWidget
                                                                          .routeName);
                                                                },
                                                                actionWhiteButton:
                                                                    (selectWhite) async {
                                                                  context.pushNamed(
                                                                      General1Widget
                                                                          .routeName);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                CustomDialogWidget(
                                                              title:
                                                                  'Запрос создан',
                                                              subtitle:
                                                                  'Запрос на оплату штрафа отправлен. Дождитесь подтверждения.',
                                                              textBlueButton:
                                                                  'В кошелёк',
                                                              textWhiteButton:
                                                                  'На главную',
                                                              actionBlueButton:
                                                                  (selectBlue) async {
                                                                context.pushNamed(
                                                                    WalletWidget
                                                                        .routeName);
                                                              },
                                                              actionWhiteButton:
                                                                  (selectWhite) async {
                                                                context.pushNamed(
                                                                    General1Widget
                                                                        .routeName);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
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
                                                        child:
                                                            CustomDialogWidget(
                                                          title:
                                                              'Не удалось создать запрос',
                                                          subtitle:
                                                              valueOrDefault<
                                                                  String>(
                                                            getJsonField(
                                                              _model
                                                                  .createFinePaymentRequest,
                                                              r'''$.error''',
                                                            )?.toString(),
                                                            'Не удалось создать запрос на оплату штрафа. Попробуйте позже.',
                                                          ),
                                                          textBlueButton:
                                                              'В кошелёк',
                                                          textWhiteButton:
                                                              'На главную',
                                                          actionBlueButton:
                                                              (selectBlue) async {
                                                            context.pushNamed(
                                                                WalletWidget
                                                                    .routeName);
                                                          },
                                                          actionWhiteButton:
                                                              (selectWhite) async {
                                                            context.pushNamed(
                                                                General1Widget
                                                                    .routeName);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }

                                            safeSetState(() {});
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
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
