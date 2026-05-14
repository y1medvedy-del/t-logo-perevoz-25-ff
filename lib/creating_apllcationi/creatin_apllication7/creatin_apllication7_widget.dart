import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/type_payment_widget.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/creating_apllcationi/create_application_payment_type_accaut_payment/create_application_payment_type_accaut_payment_widget.dart';
import '/creating_apllcationi/create_application_payment_type_card_commission/create_application_payment_type_card_commission_widget.dart';
import '/creating_apllcationi/create_application_payment_type_score/create_application_payment_type_score_widget.dart';
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
import 'creatin_apllication7_model.dart';
export 'creatin_apllication7_model.dart';

class CreatinApllication7Widget extends StatefulWidget {
  const CreatinApllication7Widget({
    super.key,
    required this.cityAbriviature,
    this.typePayment,
  });

  final String? cityAbriviature;
  final String? typePayment;

  static String routeName = 'creatin_apllication7';
  static String routePath = 'creatinApllication7';

  @override
  State<CreatinApllication7Widget> createState() =>
      _CreatinApllication7WidgetState();
}

class _CreatinApllication7WidgetState extends State<CreatinApllication7Widget> {
  late CreatinApllication7Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatinApllication7Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (widget.typePayment != null && widget.typePayment != '') {
            _model.pyamentTypeSelect = widget.typePayment;
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

          safeSetState(() {});
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
                            text: 'Выбор оплаты',
                            creatinStage: _model.stage,
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
                                        return Builder(
                                          builder: (context) =>
                                              TypePaymentWidget(
                                            key: Key(
                                                'Key2ge_${columnIndex}_of_${columnTypePaymentRowList.length}'),
                                            title: columnTypePaymentRow.name!,
                                            variable: _model.pyamentTypeSelect,
                                            subtitle: () {
                                              if (columnTypePaymentRow.name ==
                                                  'По счету') {
                                                return (_model.contract !=
                                                            null &&
                                                        (_model.contract)!
                                                            .isNotEmpty
                                                    ? 'Догогвор подписан'
                                                    : 'Не доступно без договора');
                                              } else if (columnTypePaymentRow
                                                      .name ==
                                                  'Кошелёк') {
                                                return 'Ваш баланс: ${valueOrDefault<String>(
                                                  _model.wallet?.firstOrNull
                                                      ?.currentBalance
                                                      .toString(),
                                                  '0',
                                                )}₽';
                                              } else if (columnTypePaymentRow
                                                      .name ==
                                                  'Карта') {
                                                return 'Visa, Mastercard, MIR';
                                              } else {
                                                return ' ';
                                              }
                                            }(),
                                            action: () async {
                                              if (columnTypePaymentRow.name ==
                                                  'Карта') {
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
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              CreateApplicationPaymentTypeCardCommissionWidget(
                                                            action:
                                                                (paymentTaype) async {
                                                              _model.pyamentTypeSelect =
                                                                  paymentTaype;
                                                              safeSetState(
                                                                  () {});
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else if (columnTypePaymentRow
                                                      .name ==
                                                  'По счету') {
                                                _model.myCompanyQuery =
                                                    await CompanyTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    FFAppState().myCompany,
                                                  ),
                                                );
                                                if (_model
                                                        .myCompanyQuery
                                                        ?.firstOrNull
                                                        ?.contract ==
                                                    true) {
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
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                CreateApplicationPaymentTypeScoreWidget(
                                                              action:
                                                                  (paymentTaype) async {
                                                                _model.pyamentTypeSelect =
                                                                    paymentTaype;
                                                                safeSetState(
                                                                    () {});
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.pyamentTypeSelect =
                                                      columnTypePaymentRow.name;
                                                  safeSetState(() {});
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
                                                                CreateApplicationPaymentTypeAccautPaymentWidget(
                                                              stage:
                                                                  _model.stage,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                _model.pyamentTypeSelect =
                                                    columnTypePaymentRow.name;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 16.0),
                          child: Container(
                            width: 700.0,
                            decoration: BoxDecoration(),
                          ),
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
                            child: FutureBuilder<List<SettingsRow>>(
                              future: SettingsTable().querySingleRow(
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SettingsRow> buttonSettingsRowList =
                                    snapshot.data!;

                                final buttonSettingsRow =
                                    buttonSettingsRowList.isNotEmpty
                                        ? buttonSettingsRowList.first
                                        : null;

                                return FFButtonWidget(
                                  onPressed: (_model.pyamentTypeSelect ==
                                              null ||
                                          _model.pyamentTypeSelect == '')
                                      ? null
                                      : () async {
                                          if (currentUserEmail != '') {
                                            FFAppState()
                                                .updateAplicationLocalStruct(
                                              (e) => e
                                                ..paymentType =
                                                    _model.pyamentTypeSelect
                                                ..creatinStage = _model.stage
                                                ..createDate =
                                                    getCurrentTimestamp,
                                            );
                                            safeSetState(() {});
                                            _model.markupCompany =
                                                await MarkupPraceTable()
                                                    .queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'company_id',
                                                FFAppState().myCompany,
                                              ),
                                            );
                                            _model.newApplication =
                                                await AplicationTable().insert({
                                              'creator': FFAppState().myID,
                                              'city_id': FFAppState()
                                                  .aplicationLocal
                                                  .cityId,
                                              'adres_street_creator':
                                                  FFAppState()
                                                      .aplicationLocal
                                                      .addressStreet,
                                              'type_cargo': FFAppState()
                                                  .aplicationLocal
                                                  .typeCargo,
                                              'adress_house_creator':
                                                  valueOrDefault<String>(
                                                FFAppState()
                                                    .aplicationLocal
                                                    .addressHouse,
                                                '0',
                                              ),
                                              'desiret_date': FFAppState()
                                                  .aplicationLocal
                                                  .desiretDate,
                                              'desiret_time':
                                                  valueOrDefault<String>(
                                                FFAppState()
                                                    .aplicationLocal
                                                    .desiretTime,
                                                'Устроит время, выбранное исполнителем',
                                              ),
                                              'description': FFAppState()
                                                  .aplicationLocal
                                                  .description,
                                              'payment_type': FFAppState()
                                                  .aplicationLocal
                                                  .paymentType,
                                              'job status': 'Создана',
                                              'payment status': 'Не оплачена',
                                              'company_id':
                                                  FFAppState().myCompany,
                                              'wallet_admin': buttonSettingsRow
                                                  ?.adminWalletId,
                                              'admin_id': buttonSettingsRow
                                                  ?.currentAdminUserId,
                                              'admin_company': buttonSettingsRow
                                                  ?.adminCompanyId,
                                              'lat': FFAppState()
                                                  .aplicationLocal
                                                  .lat,
                                              'lon': FFAppState()
                                                  .aplicationLocal
                                                  .lon,
                                              'city': FFAppState()
                                                  .aplicationLocal
                                                  .cityName,
                                              'phone_driver': FFAppState()
                                                  .aplicationLocal
                                                  .phoneDriver,
                                              'name_car': FFAppState()
                                                  .aplicationLocal
                                                  .nameCar,
                                              'surname_driver': FFAppState()
                                                  .aplicationLocal
                                                  .surnameDriver,
                                              'patronymic_driver': FFAppState()
                                                  .aplicationLocal
                                                  .patronymicDriver,
                                              'name_driver': FFAppState()
                                                  .aplicationLocal
                                                  .nameDriver,
                                              'number_car': FFAppState()
                                                  .aplicationLocal
                                                  .namberCar,
                                              'markup': valueOrDefault<int>(
                                                _model.markupCompany
                                                    ?.firstOrNull?.procent,
                                                0,
                                              ),
                                            });
                                            await Future.wait([
                                              Future(() async {
                                                for (int loop1Index = 0;
                                                    loop1Index <
                                                        FFAppState()
                                                            .aplicationLocal
                                                            .photoList
                                                            .length;
                                                    loop1Index++) {
                                                  final currentLoop1Item =
                                                      FFAppState()
                                                              .aplicationLocal
                                                              .photoList[
                                                          loop1Index];
                                                  await ApplicationContentTable()
                                                      .insert({
                                                    'id_application': _model
                                                        .newApplication?.id,
                                                    'photo': true,
                                                    'reference_file':
                                                        FFAppState()
                                                            .aplicationLocal
                                                            .photoList
                                                            .elementAtOrNull(
                                                                loop1Index),
                                                  });
                                                }
                                              }),
                                              Future(() async {
                                                for (int loop2Index = 0;
                                                    loop2Index <
                                                        FFAppState()
                                                            .aplicationLocal
                                                            .videoList
                                                            .length;
                                                    loop2Index++) {
                                                  final currentLoop2Item =
                                                      FFAppState()
                                                              .aplicationLocal
                                                              .videoList[
                                                          loop2Index];
                                                  await ApplicationContentTable()
                                                      .insert({
                                                    'id_application': _model
                                                        .newApplication?.id,
                                                    'video': true,
                                                    'reference_file':
                                                        FFAppState()
                                                            .aplicationLocal
                                                            .videoList
                                                            .elementAtOrNull(
                                                                loop2Index),
                                                  });
                                                }
                                              }),
                                            ]);
                                            _model.result = await actions
                                                .addWorksToSupabase(
                                              FFAppState()
                                                  .aplicationLocal
                                                  .declaredWorks
                                                  .toList(),
                                              _model.newApplication?.id,
                                            );
                                            if (FFAppState()
                                                .aplicationLocal
                                                .draft) {
                                              FFAppState()
                                                  .removeAtIndexFromLocalApplicationList(
                                                      FFAppState()
                                                          .aplicationLocal
                                                          .draftItem);
                                              safeSetState(() {});
                                            } else {
                                              await Future.delayed(
                                                Duration(
                                                  milliseconds: 500,
                                                ),
                                              );
                                            }

                                            FFAppState().aplicationLocal =
                                                AplicationLocalStruct();
                                            safeSetState(() {});

                                            context.pushNamed(
                                              CreatinApllication8Widget
                                                  .routeName,
                                              queryParameters: {
                                                'aplicationDoc': serializeParam(
                                                  _model.newApplication,
                                                  ParamType.SupabaseRow,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            FFAppState()
                                                .updateAplicationLocalStruct(
                                              (e) => e
                                                ..creatinStage = _model.stage,
                                            );
                                            safeSetState(() {});
                                            if (FFAppState()
                                                    .aplicationLocal
                                                    .draft ==
                                                true) {
                                              FFAppState()
                                                  .updateLocalApplicationListAtIndex(
                                                FFAppState()
                                                    .aplicationLocal
                                                    .draftItem,
                                                (_) => FFAppState()
                                                    .aplicationLocal,
                                              );
                                              safeSetState(() {});
                                            } else {
                                              FFAppState()
                                                  .updateAplicationLocalStruct(
                                                (e) => e..draft = true,
                                              );
                                              safeSetState(() {});
                                              FFAppState()
                                                  .addToLocalApplicationList(
                                                      FFAppState()
                                                          .aplicationLocal);
                                              safeSetState(() {});
                                            }

                                            FFAppState().updateDateDraft =
                                                getCurrentTimestamp;
                                            safeSetState(() {});
                                            FFAppState().aplicationLocal =
                                                AplicationLocalStruct();
                                            safeSetState(() {});
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
                                                            'Заявка сохранена в черновики',
                                                        subtitle:
                                                            'Для публикации заявки и получения полного доступа к функциям приложения, пожалуйста, зарегистрируйтесь или войдите в существующий аккаунт.',
                                                        textBlueButton:
                                                            'Регистрация',
                                                        textWhiteButton:
                                                            'Продолжить',
                                                        actionBlueButton:
                                                            (selectBlue) async {
                                                          context.goNamed(
                                                              Onbording2Widget
                                                                  .routeName);
                                                        },
                                                        actionWhiteButton:
                                                            (selectWhite) async {
                                                          context.pushNamed(
                                                              General1AnanimusWidget
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
                                  text: 'Продолжить',
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
