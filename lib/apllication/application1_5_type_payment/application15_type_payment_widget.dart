import '/backend/supabase/supabase.dart';
import '/components/type_payment_widget.dart';
import '/creating_apllcationi/create_application_payment_type_accaut_payment/create_application_payment_type_accaut_payment_widget.dart';
import '/creating_apllcationi/create_application_payment_type_card_commission/create_application_payment_type_card_commission_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'application15_type_payment_model.dart';
export 'application15_type_payment_model.dart';

class Application15TypePaymentWidget extends StatefulWidget {
  const Application15TypePaymentWidget({
    super.key,
    this.typePayment,
    required this.idApplication,
  });

  final String? typePayment;
  final int? idApplication;

  static String routeName = 'application1_5_TypePayment';
  static String routePath = 'application15TypePayment';

  @override
  State<Application15TypePaymentWidget> createState() =>
      _Application15TypePaymentWidgetState();
}

class _Application15TypePaymentWidgetState
    extends State<Application15TypePaymentWidget> {
  late Application15TypePaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Application15TypePaymentModel());

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
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).width >
                        MediaQuery.sizeOf(context).height
                    ? 136.0
                    : 84.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            22.0, 22.0, 22.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/11rohq6o95fb/Frame_1851040040.png',
                            width: 227.0,
                            height: 32.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width >
                                    MediaQuery.sizeOf(context).height
                                ? 54.0
                                : 24.0,
                            0.0,
                          ),
                          24.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width >
                                    MediaQuery.sizeOf(context).height
                                ? 54.0
                                : 24.0,
                            0.0,
                          ),
                          16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 14.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Выбор оплаты',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(General1Widget.routeName);
                              },
                              text: '',
                              icon: Icon(
                                Icons.close_sharp,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                width: 44.0,
                                height: 44.0,
                                padding: EdgeInsets.all(10.0),
                                iconPadding: EdgeInsets.all(0.0),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TypePaymentRow> columnTypePaymentRowList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnTypePaymentRowList.length,
                                    (columnIndex) {
                                  final columnTypePaymentRow =
                                      columnTypePaymentRowList[columnIndex];
                                  return Builder(
                                    builder: (context) => TypePaymentWidget(
                                      key: Key(
                                          'Keyrtf_${columnIndex}_of_${columnTypePaymentRowList.length}'),
                                      title: columnTypePaymentRow.name!,
                                      variable: _model.pyamentTypeSelect,
                                      subtitle: () {
                                        if (columnTypePaymentRow.name ==
                                            'По счету') {
                                          return (_model.contract != null &&
                                                  (_model.contract)!.isNotEmpty
                                              ? 'Догогвор подписан'
                                              : 'Не доступно без договора');
                                        } else if (columnTypePaymentRow.name ==
                                            'Кошелёк') {
                                          return 'Ваш баланс: ${valueOrDefault<String>(
                                            _model.wallet?.firstOrNull
                                                ?.currentBalance
                                                .toString(),
                                            '0',
                                          )}₽';
                                        } else if (columnTypePaymentRow.name ==
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
                                                        CreateApplicationPaymentTypeCardCommissionWidget(
                                                      action:
                                                          (paymentTaype) async {
                                                        _model.pyamentTypeSelect =
                                                            paymentTaype;
                                                        safeSetState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else if (columnTypePaymentRow.name ==
                                            'По счету') {
                                          _model.myCompanyQuery =
                                              await CompanyTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              FFAppState().myCompany,
                                            ),
                                          );
                                          if (_model.myCompanyQuery?.firstOrNull
                                                  ?.contract ==
                                              true) {
                                            _model.pyamentTypeSelect =
                                                columnTypePaymentRow.name;
                                            safeSetState(() {});
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
                                                      child:
                                                          CreateApplicationPaymentTypeAccautPaymentWidget(
                                                        stage: _model.stage,
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
              Flexible(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
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
                                30.0,
                              )),
                          child: FFButtonWidget(
                            onPressed: (_model.pyamentTypeSelect == null ||
                                    _model.pyamentTypeSelect == '')
                                ? null
                                : () async {
                                    await AplicationTable().update(
                                      data: {
                                        'payment_type':
                                            _model.pyamentTypeSelect,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget.idApplication,
                                      ),
                                    );
                                    context.safePop();
                                  },
                            text: 'Сохранить',
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
