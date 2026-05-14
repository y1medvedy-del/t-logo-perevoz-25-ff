import '/backend/supabase/supabase.dart';
import '/components/type_payment_widget.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/creating_apllcationi/create_application_payment_type_accaut_payment/create_application_payment_type_accaut_payment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/window/information_dialog/information_dialog_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wallet_type_replece_model.dart';
export 'wallet_type_replece_model.dart';

class WalletTypeRepleceWidget extends StatefulWidget {
  const WalletTypeRepleceWidget({
    super.key,
    required this.summ,
    required this.replaceOutput,
  });

  final double? summ;
  final bool? replaceOutput;

  static String routeName = 'wallet_type_replece';
  static String routePath = 'walletTypeReplece';

  @override
  State<WalletTypeRepleceWidget> createState() =>
      _WalletTypeRepleceWidgetState();
}

class _WalletTypeRepleceWidgetState extends State<WalletTypeRepleceWidget> {
  late WalletTypeRepleceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletTypeRepleceModel());

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
                            text: valueOrDefault<String>(
                              widget.replaceOutput! ? 'Пополнеие' : 'Вывод',
                              'Пополненеи кошелька',
                            ),
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
                                            MediaQuery.sizeOf(context).height
                                        ? 58.0
                                        : 30.0,
                                    0.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: FutureBuilder<List<TypePaymentRow>>(
                                future: TypePaymentTable().queryRows(
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
                                  List<TypePaymentRow>
                                      columnTypePaymentRowList = snapshot.data!;

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnTypePaymentRowList.length,
                                          (columnIndex) {
                                        final columnTypePaymentRow =
                                            columnTypePaymentRowList[
                                                columnIndex];
                                        return Visibility(
                                          visible: columnTypePaymentRow.name !=
                                              'Кошелёк',
                                          child: TypePaymentWidget(
                                            key: Key(
                                                'Keyvje_${columnIndex}_of_${columnTypePaymentRowList.length}'),
                                            title: columnTypePaymentRow.name!,
                                            variable: _model.pyamentTypeSelect,
                                            action: () async {
                                              _model.pyamentTypeSelect =
                                                  columnTypePaymentRow.name;
                                              safeSetState(() {});
                                            },
                                          ),
                                        );
                                      }).divide(
                                        SizedBox(height: 16.0),
                                        filterFn: (columnIndex) {
                                          final columnTypePaymentRow =
                                              columnTypePaymentRowList[
                                                  columnIndex];
                                          return columnTypePaymentRow.name !=
                                              'Кошелёк';
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
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
                            onPressed: (_model.pyamentTypeSelect == null ||
                                    _model.pyamentTypeSelect == '')
                                ? null
                                : () async {
                                    var _shouldSetState = false;
                                    if (widget.replaceOutput == true) {
                                      if (_model.pyamentTypeSelect ==
                                          'По счету') {
                                        _model.qureyDocumentContract =
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
                                        if (_model.qureyDocumentContract !=
                                                null &&
                                            (_model.qureyDocumentContract)!
                                                .isNotEmpty) {
                                          _model.queryReplaceOutput =
                                              await ReplaceOutputTable()
                                                  .queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'status',
                                                  'Ожидает',
                                                )
                                                .eqOrNull(
                                                  'replace',
                                                  true,
                                                )
                                                .eqOrNull(
                                                  'creator_id',
                                                  FFAppState().myID,
                                                )
                                                .eqOrNull(
                                                  'type_pyament',
                                                  'По счету',
                                                )
                                                .eqOrNull(
                                                  'wallet',
                                                  buttonWalletsRow?.id,
                                                ),
                                          );
                                          _shouldSetState = true;
                                          if (!(_model.queryReplaceOutput !=
                                                  null &&
                                              (_model.queryReplaceOutput)!
                                                  .isNotEmpty)) {
                                            await ReplaceOutputTable().insert({
                                              'replace': true,
                                              'wallet': buttonWalletsRow?.id,
                                              'status': 'Ожидает',
                                              'creator_id': FFAppState().myID,
                                              'amount': widget.summ,
                                              'type_pyament': 'По счету',
                                              'company_id':
                                                  FFAppState().myCompany,
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title:
                                                        Text('Ожидайте счет'),
                                                    content: Text(
                                                        'Мы увидили ваш запрос на пополнение по счету и уже занимаемся его созданием'),
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

                                            context.pushNamed(
                                                WalletWidget.routeName);
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          InformationDialogWidget(
                                                        title:
                                                            'Запрос уже создан',
                                                        subtitle:
                                                            'E вас уже создан запрос на пополнение кошелька. Дождитесь его обработки или свяжитесь с администрацией',
                                                        textBlueButton:
                                                            'В кошелёк',
                                                        textWhaitButton:
                                                            'Написать администратору',
                                                        actionBlueButton:
                                                            (selectBlue) async {
                                                          context.pushNamed(
                                                              WalletWidget
                                                                  .routeName);
                                                        },
                                                        actionWhaitButton:
                                                            () async {
                                                          _model.quryChatAdmin =
                                                              await ChatTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user carrier',
                                                                  FFAppState()
                                                                      .myID,
                                                                )
                                                                .eqOrNull(
                                                                  'chat_admin',
                                                                  true,
                                                                ),
                                                          );
                                                          if (_model.quryChatAdmin !=
                                                                  null &&
                                                              (_model.quryChatAdmin)!
                                                                  .isNotEmpty) {
                                                            context.pushNamed(
                                                              Chat3AdminWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'idChat':
                                                                    serializeParam(
                                                                  _model
                                                                      .quryChatAdmin
                                                                      ?.firstOrNull
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            _model.newChatAdmin =
                                                                await ChatTable()
                                                                    .insert({
                                                              'user carrier':
                                                                  FFAppState()
                                                                      .myID,
                                                              'chat_admin':
                                                                  true,
                                                            });

                                                            context.pushNamed(
                                                              Chat3AdminWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'idChat':
                                                                    serializeParam(
                                                                  _model
                                                                      .newChatAdmin
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
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
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'Перевод / Наличные') {
                                        _model.queryReplaceOutputCash =
                                            await ReplaceOutputTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'status',
                                                'Ожидает',
                                              )
                                              .eqOrNull(
                                                'replace',
                                                true,
                                              )
                                              .eqOrNull(
                                                'creator_id',
                                                FFAppState().myID,
                                              )
                                              .eqOrNull(
                                                'type_pyament',
                                                'Перевод / Наличные',
                                              )
                                              .eqOrNull(
                                                'wallet',
                                                buttonWalletsRow?.id,
                                              ),
                                        );
                                        _shouldSetState = true;
                                        if (!(_model.queryReplaceOutputCash !=
                                                null &&
                                            (_model.queryReplaceOutputCash)!
                                                .isNotEmpty)) {
                                          _model.newReplaceOutpute =
                                              await ReplaceOutputTable()
                                                  .insert({
                                            'replace': true,
                                            'wallet': buttonWalletsRow?.id,
                                            'status': 'Ожидает',
                                            'creator_id': FFAppState().myID,
                                            'amount': widget.summ,
                                            'type_pyament':
                                                'Перевод / Наличные',
                                            'company_id':
                                                FFAppState().myCompany,
                                          });
                                          _shouldSetState = true;
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Запрос создан'),
                                                  content: Text(
                                                      'Мы увидили ваш запрос на пополнение Перевод / Наличные и уже занимаемся его созданием'),
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

                                          context.pushNamed(
                                              WalletWidget.routeName);
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
                                                        InformationDialogWidget(
                                                      title:
                                                          'Запрос уже создан',
                                                      subtitle:
                                                          'E вас уже создан запрос на пополнение кошелька. Дождитесь его обработки или свяжитесь с администрацией',
                                                      textBlueButton:
                                                          'В кошелёк',
                                                      textWhaitButton:
                                                          'Написать администратору',
                                                      actionBlueButton:
                                                          (selectBlue) async {
                                                        context.pushNamed(
                                                            WalletWidget
                                                                .routeName);
                                                      },
                                                      actionWhaitButton:
                                                          () async {
                                                        _model.quryChatAdminCash =
                                                            await ChatTable()
                                                                .queryRows(
                                                          queryFn: (q) => q
                                                              .eqOrNull(
                                                                'user carrier',
                                                                FFAppState()
                                                                    .myID,
                                                              )
                                                              .eqOrNull(
                                                                'chat_admin',
                                                                true,
                                                              ),
                                                        );
                                                        if (_model.quryChatAdminCash !=
                                                                null &&
                                                            (_model.quryChatAdminCash)!
                                                                .isNotEmpty) {
                                                          context.pushNamed(
                                                            Chat3AdminWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'idChat':
                                                                  serializeParam(
                                                                _model
                                                                    .quryChatAdminCash
                                                                    ?.firstOrNull
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          _model.newChatAdminCash =
                                                              await ChatTable()
                                                                  .insert({
                                                            'user carrier':
                                                                FFAppState()
                                                                    .myID,
                                                            'chat_admin': true,
                                                          });

                                                          context.pushNamed(
                                                            Chat3AdminWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'idChat':
                                                                  serializeParam(
                                                                _model
                                                                    .newChatAdminCash
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'Карта') {
                                        _model.createWalletTopupPayment =
                                            await actions.createPayment(
                                          'wallet_topup',
                                          widget.summ,
                                          null,
                                          null,
                                        );
                                        _shouldSetState = true;
                                        if (getJsonField(
                                              _model.createWalletTopupPayment,
                                              r'''$.paymentUrl''',
                                            ) !=
                                            null) {
                                          FFAppState().lastPaymentId =
                                              getJsonField(
                                            _model.createWalletTopupPayment,
                                            r'''$.paymentId''',
                                          ).toString();
                                          FFAppState().lastOrderId =
                                              getJsonField(
                                            _model.createWalletTopupPayment,
                                            r'''$.orderId''',
                                          ).toString();
                                          safeSetState(() {});
                                          await launchURL(getJsonField(
                                            _model.createWalletTopupPayment,
                                            r'''$.paymentUrl''',
                                          ).toString());
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

                                      context.pushNamed(WalletWidget.routeName);
                                    } else {
                                      if (_model.pyamentTypeSelect ==
                                          'По счету') {
                                        final selectedFiles = await selectFiles(
                                          storageFolderPath: 'carrier',
                                          allowedExtensions: ['pdf'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_paymentInvose =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: 'replace_output',
                                              selectedFiles: selectedFiles,
                                            );
                                          } finally {
                                            _model.isDataUploading_paymentInvose =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedFiles.length &&
                                              downloadUrls.length ==
                                                  selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_paymentInvose =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_paymentInvose =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl_paymentInvose !=
                                                '') {
                                          _model.newOutput =
                                              await ReplaceOutputTable()
                                                  .insert({
                                            'replace': false,
                                            'wallet': buttonWalletsRow?.id,
                                            'amount': widget.summ,
                                            'type_pyament':
                                                _model.pyamentTypeSelect,
                                            'company_id':
                                                FFAppState().myCompany,
                                            'creator_id': FFAppState().myID,
                                          });
                                          _shouldSetState = true;
                                          await PaymentInvoiceTable().insert({
                                            'title':
                                                'Счет на оплату на Вывод № ${_model.newOutput?.id.toString()}',
                                            'creator': FFAppState().myID,
                                            'replace_output':
                                                _model.newOutput?.id,
                                            'link': _model
                                                .uploadedFileUrl_paymentInvose,
                                            'for_admin': true,
                                            'amount': _model.newOutput?.amount,
                                          });
                                        }
                                      } else if (_model.pyamentTypeSelect ==
                                          'Наличные') {}

                                      context.pushNamed(WalletWidget.routeName);
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                            text: widget.replaceOutput!
                                ? 'Пополнить'
                                : 'Вывести',
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
                          );
                        },
                      ),
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
