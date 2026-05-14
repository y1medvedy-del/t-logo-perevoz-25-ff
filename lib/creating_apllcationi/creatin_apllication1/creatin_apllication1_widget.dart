import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/creating_apllcationi/city_request/city_request_widget.dart';
import '/creating_apllcationi/create_application_payment_fine/create_application_payment_fine_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'creatin_apllication1_model.dart';
export 'creatin_apllication1_model.dart';

class CreatinApllication1Widget extends StatefulWidget {
  const CreatinApllication1Widget({super.key});

  static String routeName = 'creatin_apllication1';
  static String routePath = 'creatinApllication1';

  @override
  State<CreatinApllication1Widget> createState() =>
      _CreatinApllication1WidgetState();
}

class _CreatinApllication1WidgetState extends State<CreatinApllication1Widget> {
  late CreatinApllication1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatinApllication1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().aplicationLocal.cityName != '') {
        _model.cityName = FFAppState().aplicationLocal.cityName;
        _model.cityID = FFAppState().aplicationLocal.cityId;
        _model.cityAbriviatyre = FFAppState().aplicationLocal.cityAbriviatyre;
        _model.cityArea = FFAppState().aplicationLocal.areaCity;
        safeSetState(() {});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.aCapCloseModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ACapCloseWidget(
                        text: 'Выберите город',
                        creatinStage: 1,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Container(
                          width: 700.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: FutureBuilder<List<CityRow>>(
                                        future: FFAppState().city(
                                          requestFn: () =>
                                              CityTable().queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'worker',
                                                  true,
                                                )
                                                .order('name', ascending: true),
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
                                          List<CityRow> listViewCityRowList =
                                              snapshot.data!;

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCityRowList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCityRow =
                                                  listViewCityRowList[
                                                      listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateAplicationLocalStruct(
                                                    (e) => e
                                                      ..cityId =
                                                          listViewCityRow.id
                                                      ..cityName =
                                                          listViewCityRow.name
                                                      ..cityAbriviatyre =
                                                          listViewCityRow
                                                              .abbreviature
                                                      ..areaCity =
                                                          listViewCityRow.area,
                                                  );
                                                  safeSetState(() {});
                                                  _model.cityName =
                                                      listViewCityRow.name;
                                                  _model.cityArea =
                                                      listViewCityRow.area;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 700.0,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              listViewCityRow
                                                                  .name!,
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
                                                            Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/2dgw6weoz0pz/icon%D0%B2%D0%B0%D1%8B%D0%B2%D1%81%D1%8B%D1%87%D1%81.png',
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                if (_model
                                                                        .cityName ==
                                                                    listViewCityRow
                                                                        .name)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/fx9tymhl9eof/icon2345.png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 700.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
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
                                  Flexible(
                                    child: Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
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
                                                    child: CityRequestWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Города нет в списке',
                                        options: FFButtonOptions(
                                          width: 695.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
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
                                                        .accent4,
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
                                                .primary,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 100.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                      child: FFButtonWidget(
                        onPressed: (_model.cityName == null ||
                                _model.cityName == '')
                            ? null
                            : () async {
                                await actions
                                    .cancelExpiredFinesByCompanyAndCity(
                                  FFAppState().myCompany,
                                  _model.cityName!,
                                );
                                _model.fine = await FineTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'company_id',
                                        FFAppState().myCompany,
                                      )
                                      .eqOrNull(
                                        'city_bloking',
                                        _model.cityName,
                                      ),
                                );
                                if (_model.fine != null &&
                                    (_model.fine)!.isNotEmpty) {
                                  if (functions.fine24hour(
                                      _model.fine?.firstOrNull?.createdAt,
                                      getCurrentTimestamp)!) {
                                    await FineTable().update(
                                      data: {
                                        'valid': false,
                                      },
                                      matchingRows: (rows) => rows
                                          .eqOrNull(
                                            'company_id',
                                            FFAppState().myID,
                                          )
                                          .eqOrNull(
                                            'valid',
                                            true,
                                          )
                                          .eqOrNull(
                                            'city_bloking',
                                            _model.cityName,
                                          ),
                                    );

                                    context.pushNamed(
                                      CreatinApllication2Widget.routeName,
                                      queryParameters: {
                                        'cityPageParametr': serializeParam(
                                          _model.cityName,
                                          ParamType.String,
                                        ),
                                        'area': serializeParam(
                                          _model.cityArea,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
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
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  CreateApplicationPaymentFineWidget(
                                                fine: _model
                                                    .fine!.firstOrNull!.id,
                                                city: _model.cityName!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                } else {
                                  context.pushNamed(
                                    CreatinApllication2Widget.routeName,
                                    queryParameters: {
                                      'cityPageParametr': serializeParam(
                                        _model.cityName,
                                        ParamType.String,
                                      ),
                                      'area': serializeParam(
                                        _model.cityArea,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor: FlutterFlowTheme.of(context).accent1,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
