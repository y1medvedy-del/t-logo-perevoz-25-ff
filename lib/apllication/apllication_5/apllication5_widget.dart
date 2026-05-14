import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_window_card_comission/application_window_card_comission_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/type_payment_widget.dart';
import '/creating_apllcationi/create_application_payment_type_accaut_payment/create_application_payment_type_accaut_payment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import '/window/payment_successful/payment_successful_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'apllication5_model.dart';
export 'apllication5_model.dart';

class Apllication5Widget extends StatefulWidget {
  const Apllication5Widget({
    super.key,
    required this.paymentType,
    required this.applicationID,
  });

  final String? paymentType;
  final int? applicationID;

  static String routeName = 'apllication_5';
  static String routePath = 'apllication5';

  @override
  State<Apllication5Widget> createState() => _Apllication5WidgetState();
}

class _Apllication5WidgetState extends State<Apllication5Widget> {
  late Apllication5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Apllication5Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (widget.paymentType != null && widget.paymentType != '') {
            _model.pyamentTypeSelect = widget.paymentType;
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
                child: FutureBuilder<List<ApplicationWalletViewRow>>(
                  future: ApplicationWalletViewTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'application_id',
                      widget.applicationID,
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
                    List<ApplicationWalletViewRow>
                        stackApplicationWalletViewRowList = snapshot.data!;

                    final stackApplicationWalletViewRow =
                        stackApplicationWalletViewRowList.isNotEmpty
                            ? stackApplicationWalletViewRowList.first
                            : null;

                    return Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.aCapCancelModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ACapCancelWidget(
                                applicationID: widget.applicationID!,
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
                                                  AlwaysStoppedAnimation<Color>(
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
                                                    'Keyszj_${columnIndex}_of_${columnTypePaymentRowList.length}'),
                                                title:
                                                    columnTypePaymentRow.name!,
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

                                                    safeSetState(() {});
                                                  } else {
                                                    _model.pyamentTypeSelect =
                                                        columnTypePaymentRow
                                                            .name;
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
                                  30.0,
                                )),
                            child: FFButtonWidget(
                              onPressed: (_model.pyamentTypeSelect == null ||
                                      _model.pyamentTypeSelect == '')
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      await AplicationTable().update(
                                        data: {
                                          'payment_type':
                                              _model.pyamentTypeSelect,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.applicationID,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      _model.application =
                                          await AplicationTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          widget.applicationID,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      if (_model.pyamentTypeSelect ==
                                          'Кошелёк') {
                                        _model.queryWaletsAction =
                                            await WalletsTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'company_id',
                                            FFAppState().myCompany,
                                          ),
                                        );
                                        _shouldSetState = true;
                                        if ((_model.queryWaletsAction != null &&
                                                (_model.queryWaletsAction)!
                                                    .isNotEmpty) ==
                                            true) {
                                          if (_model
                                                  .queryWaletsAction!
                                                  .firstOrNull!
                                                  .currentBalance >=
                                              stackApplicationWalletViewRow!
                                                  .applicationAmount!) {
                                            _model.callWalletPayment =
                                                await actions.callWalletPayment(
                                              stackApplicationWalletViewRow
                                                  .applicationCreator!,
                                              stackApplicationWalletViewRow
                                                  .applicationExecutor!,
                                              stackApplicationWalletViewRow
                                                  .applicationAmount!,
                                              stackApplicationWalletViewRow
                                                  .applicationId!,
                                            );
                                            _shouldSetState = true;
                                            if (_model.callWalletPayment ==
                                                'Успешно') {
                                              await AplicationTable().update(
                                                data: {
                                                  'payment status': 'Оплачена',
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  stackApplicationWalletViewRow
                                                      .applicationId,
                                                ),
                                              );
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
                                                            PaymentSuccessfulWidget(
                                                          idApplication: widget
                                                              .applicationID!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              Navigator.pop(context);
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text(_model
                                                          .callWalletPayment!),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
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
                                                            'Недостаточно средств',
                                                        subtitle:
                                                            'На вашем кошельке недостаточно средств для оплаты. Пожалуйста, пополните кошелёк или выберите другой способ оплаты.',
                                                        textBlueButton:
                                                            'Пополнить',
                                                        textWhiteButton:
                                                            'Изменить',
                                                        actionBlueButton:
                                                            (selectBlue) async {
                                                          context.pushNamed(
                                                              WalletWidget
                                                                  .routeName);
                                                        },
                                                        actionWhiteButton:
                                                            (selectWhite) async {
                                                          Navigator.pop(
                                                              context);
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
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Кошелёк недоступен'),
                                                  content: Text(
                                                      'Сейчас не удалось получить данные кошелька. Попробуйте позже или обратитесь в поддержку.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'Перевод / Наличные') {
                                        _model.createCashTransaction =
                                            await actions
                                                .createCashTransactions(
                                          stackApplicationWalletViewRow!
                                              .applicationId!,
                                          stackApplicationWalletViewRow
                                              .applicationCreator!,
                                          stackApplicationWalletViewRow
                                              .applicationExecutor!,
                                          stackApplicationWalletViewRow
                                              .applicationAmount!,
                                        );
                                        _shouldSetState = true;
                                        if (_model.createCashTransaction ==
                                            'Успешно') {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        PaymentSuccessfulWidget(
                                                      idApplication: widget
                                                          .applicationID!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          Navigator.pop(context);
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(_model
                                                      .createCashTransaction!),
                                                  content: Text(' '),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'По счету') {
                                        _model.queryContractAction =
                                            await DocumentContractTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'company',
                                                FFAppState().myCompany,
                                              )
                                              .eqOrNull(
                                                'confirmed',
                                                true,
                                              ),
                                        );
                                        _shouldSetState = true;
                                        if (_model.queryContractAction !=
                                                null &&
                                            (_model.queryContractAction)!
                                                .isNotEmpty) {
                                          _model.paymentInvoiceApplication =
                                              await ApplicationContentTable()
                                                  .queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'id_application',
                                                  widget.applicationID,
                                                )
                                                .eqOrNull(
                                                  'payment_invoice',
                                                  true,
                                                ),
                                          );
                                          _shouldSetState = true;
                                          if (_model.paymentInvoiceApplication !=
                                                  null &&
                                              (_model.paymentInvoiceApplication)!
                                                  .isNotEmpty) {
                                            await launchURL(_model
                                                .paymentInvoiceApplication!
                                                .firstOrNull!
                                                .referenceFile!);
                                          } else {
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
                                                            'Счёт подготавливается',
                                                        subtitle:
                                                            'Мы уже начали подготовку вашего счёта. В ближайшее время вы его получите.',
                                                        textBlueButton: 'Ок',
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
                                          }
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        CreateApplicationPaymentTypeAccautPaymentWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'Карта') {
                                        _model.paymentUrlJson =
                                            await actions.createPayment(
                                          'order_payment',
                                          null,
                                          'order',
                                          widget.applicationID,
                                        );
                                        _shouldSetState = true;
                                        if (getJsonField(
                                              _model.paymentUrlJson,
                                              r'''$.paymentUrl''',
                                            ) !=
                                            null) {
                                          FFAppState().lastPaymentId =
                                              getJsonField(
                                            _model.paymentUrlJson,
                                            r'''$.onlinePaymentId''',
                                          ).toString();
                                          FFAppState().lastOrderId =
                                              getJsonField(
                                            _model.paymentUrlJson,
                                            r'''$.orderId''',
                                          ).toString();
                                          FFAppState().lastPaymentPurpose =
                                              'order_payment';
                                          FFAppState().lastTargetType = 'order';
                                          FFAppState().lastTargetId =
                                              widget.applicationID!;
                                          safeSetState(() {});
                                          await launchURL(getJsonField(
                                            _model.paymentUrlJson,
                                            r'''$.paymentUrl''',
                                          ).toString());

                                          context.pushNamed(
                                              WalletSuccessfullyWidget
                                                  .routeName);
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title:
                                                      Text('Попробуйте позже'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                              text: 'Оплатить',
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
