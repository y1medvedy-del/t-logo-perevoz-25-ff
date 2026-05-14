import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/info_answer/info_answer_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'apllication7_cancel_model.dart';
export 'apllication7_cancel_model.dart';

class Apllication7CancelWidget extends StatefulWidget {
  const Apllication7CancelWidget({
    super.key,
    required this.idApplication,
  });

  final int? idApplication;

  static String routeName = 'apllication_7_cancel';
  static String routePath = 'apllication7Cancel';

  @override
  State<Apllication7CancelWidget> createState() =>
      _Apllication7CancelWidgetState();
}

class _Apllication7CancelWidgetState extends State<Apllication7CancelWidget> {
  late Apllication7CancelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Apllication7CancelModel());

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
            future: AplicationTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.idApplication,
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
                            applicationID: widget.idApplication!,
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
                                    applicationID: widget.idApplication!,
                                    jobStatus: columnAplicationRow!.jobStatus!,
                                    paymentStatus:
                                        columnAplicationRow.paymentStatus!,
                                    action: (info) async {
                                      _model.info = !_model.info;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                if (_model.info)
                                  wrapWithModel(
                                    model: _model.infoApplicationModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InfoApplicationWidget(
                                      idApplication: widget.idApplication!,
                                      applicationDoc: columnAplicationRow,
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
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
                                                    'Заявка отменена ${columnAplicationRow.descriptionStatus}',
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
                                                  Text(
                                                    ' ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                          if (columnAplicationRow.answer !=
                                              null)
                                            wrapWithModel(
                                              model: _model.infoAnswerModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InfoAnswerWidget(
                                                idAnswer: columnAplicationRow
                                                    .answer!,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text(
                                          'Хотите создать эту заявку заново?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Закрыть'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Создать заявку'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            _model.newApplication =
                                await AplicationTable().insert({
                              'creator': FFAppState().myID,
                              'city_id': columnAplicationRow.cityId,
                              'adres_street_creator':
                                  columnAplicationRow.adresStreetCreator,
                              'type_cargo': columnAplicationRow.typeCargo,
                              'adress_house_creator':
                                  columnAplicationRow.adressHouseCreator,
                              'desiret_date':
                                  functions.dateToStr(getCurrentTimestamp),
                              'desiret_time': columnAplicationRow.desiretTime,
                              'description': columnAplicationRow.description,
                              'payment_type': columnAplicationRow.paymentType,
                              'job status': 'Создана',
                              'payment status': 'Не оплачена',
                              'company_id': FFAppState().myCompany,
                              'wallet_admin': columnAplicationRow.walletAdmin,
                              'admin_id': columnAplicationRow.adminId,
                              'admin_company':
                                  columnAplicationRow.adminCompany,
                              'lat': columnAplicationRow.lat,
                              'lon': columnAplicationRow.lon,
                              'city': columnAplicationRow.city,
                              'id_car': columnAplicationRow.idCar,
                              'id_driver': columnAplicationRow.idDriver,
                              'patronymic_driver':
                                  columnAplicationRow.patronymicDriver,
                              'name_driver': columnAplicationRow.nameDriver,
                              'surname_driver':
                                  columnAplicationRow.surnameDriver,
                              'phone_driver': columnAplicationRow.phoneDriver,
                              'name_car': columnAplicationRow.nameCar,
                              'number_car': columnAplicationRow.numberCar,
                            });
                            _shouldSetState = true;
                            _model.cityQuery = await CityTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                columnAplicationRow.cityId,
                              ),
                            );
                            _shouldSetState = true;
                            await AplicationTable().update(
                              data: {
                                'namber':
                                    '${_model.cityQuery?.firstOrNull?.abbreviature}${_model.newApplication?.id.toString()}',
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                _model.newApplication?.id,
                              ),
                            );
                            _shouldSetState = true;
                            await actions.copyApplicationRecords(
                              'application_content',
                              columnAplicationRow.id,
                              _model.newApplication!.id,
                            );
                            await actions.copyApplicationRecords(
                              'works_application',
                              columnAplicationRow.id,
                              _model.newApplication!.id,
                            );
                          } else {
                            Navigator.pop(context);
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          context.pushNamed(General1Widget.routeName);

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'Повторить',
                        options: FFButtonOptions(
                          width: 700.0,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    color: FlutterFlowTheme.of(context).primary,
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
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
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
                        ),
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
