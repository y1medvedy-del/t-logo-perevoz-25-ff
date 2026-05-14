import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/creat_anew_application/creat_anew_application_widget.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'general_application_model.dart';
export 'general_application_model.dart';

class GeneralApplicationWidget extends StatefulWidget {
  const GeneralApplicationWidget({
    super.key,
    required this.idApplication,
    required this.idAnswer,
    required this.aplicationDoc,
    String? numberApplication,
    required this.jobStatus,
    required this.stage,
    required this.descriptionStatus,
    required this.paymentStatus,
    required this.createAt,
    required this.city,
    required this.street,
  }) : this.numberApplication = numberApplication ?? 'number';

  final int? idApplication;
  final int? idAnswer;
  final AplicationRow? aplicationDoc;
  final String numberApplication;

  /// status
  final String? jobStatus;

  /// этап заявки для иконок и подстатусов
  final int? stage;

  final String? descriptionStatus;
  final String? paymentStatus;
  final DateTime? createAt;
  final String? city;
  final String? street;

  @override
  State<GeneralApplicationWidget> createState() =>
      _GeneralApplicationWidgetState();
}

class _GeneralApplicationWidgetState extends State<GeneralApplicationWidget>
    with TickerProviderStateMixin {
  late GeneralApplicationModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralApplicationModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.05, 1.05),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.3, 1.3),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (currentUserEmail != '') {
                  if (widget.jobStatus == 'В работе') {
                    context.pushNamed(
                      Apllication3Widget.routeName,
                      queryParameters: {
                        'applicationID': serializeParam(
                          widget.idApplication,
                          ParamType.int,
                        ),
                        'answerID': serializeParam(
                          widget.idAnswer,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  } else if (widget.jobStatus == 'Завершена') {
                    if (widget.aplicationDoc?.paymentStatus == 'Оплачена') {
                      context.pushNamed(
                        Apllication6Widget.routeName,
                        queryParameters: {
                          'applicationID': serializeParam(
                            widget.idApplication,
                            ParamType.int,
                          ),
                          'answerID': serializeParam(
                            widget.idAnswer,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      context.pushNamed(
                        Apllication4Widget.routeName,
                        queryParameters: {
                          'applicationID': serializeParam(
                            widget.idApplication,
                            ParamType.int,
                          ),
                          'answerID': serializeParam(
                            widget.idAnswer,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    }
                  } else if (widget.jobStatus == 'Отменена') {
                    context.pushNamed(
                      Apllication7CancelWidget.routeName,
                      queryParameters: {
                        'idApplication': serializeParam(
                          widget.idApplication,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    if (widget.aplicationDoc?.answerUserSelect != null) {
                      context.pushNamed(
                        Apllication2Widget.routeName,
                        queryParameters: {
                          'idApplication': serializeParam(
                            widget.idApplication,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      context.pushNamed(
                        Apllication1Widget.routeName,
                        queryParameters: {
                          'idAplication': serializeParam(
                            widget.idApplication,
                            ParamType.int,
                          ),
                          'info': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    }
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: WebViewAware(
                          child: CustomDialogWidget(
                            title: 'Доступ ограничен',
                            subtitle:
                                'Для использования всех функций приложения необходимо зарегистрироваться или войти в существующий аккаунт.  Без регистрации доступны только базовые возможности. После регистрации вы получите полный доступ ко всем разделам приложения.',
                            textBlueButton: 'Регистрация',
                            textWhiteButton: 'Продолжить',
                            actionBlueButton: (selectBlue) async {
                              context.goNamed(Onbording2Widget.routeName);
                            },
                            actionWhiteButton: (selectWhite) async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).accent2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: AutoSizeText(
                                      widget.numberApplication,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.jobStatus,
                                                  'status',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            ),
                                            Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (widget.jobStatus ==
                                                      'Создана') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  } else if (widget
                                                          .jobStatus ==
                                                      'В работе') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (widget
                                                          .jobStatus ==
                                                      'Завершена') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Builder(
                                          builder: (context) {
                                            if (widget.jobStatus !=
                                                'Завершена') {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    () {
                                                      if (widget.stage == 0) {
                                                        return 'Поиск склада';
                                                      } else if (widget
                                                              .stage ==
                                                          1) {
                                                        return 'Выберите склад';
                                                      } else if (widget
                                                              .stage ==
                                                          2) {
                                                        return 'Ожидайте ответа';
                                                      } else if (widget
                                                              .stage ==
                                                          3) {
                                                        return 'Вас ждет склад';
                                                      } else if (widget
                                                              .stage ==
                                                          4) {
                                                        return 'Перепаллечивают';
                                                      } else if (widget
                                                              .jobStatus ==
                                                          'Отменена') {
                                                        return valueOrDefault<
                                                            String>(
                                                          widget
                                                              .descriptionStatus,
                                                          'descriptionStatus',
                                                        );
                                                      } else {
                                                        return valueOrDefault<
                                                            String>(
                                                          widget
                                                              .descriptionStatus,
                                                          'descriptionStatus',
                                                        );
                                                      }
                                                    }(),
                                                    'dop status',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  minFontSize: 8.0,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                              );
                                            } else {
                                              return Builder(
                                                builder: (context) {
                                                  if (widget.paymentStatus ==
                                                      'Не оплачена') {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'Оплатите',
                                                        textAlign:
                                                            TextAlign.end,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      .error,
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
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation']!),
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'Оплачена',
                                                        textAlign:
                                                            TextAlign.end,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      .accent4,
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
                                                    );
                                                  }
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 30.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Builder(
                              builder: (context) {
                                if (widget.stage == 0) {
                                  return Lottie.asset(
                                    'assets/jsons/search.json',
                                    width: 28.0,
                                    height: 28.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  );
                                } else if (widget.stage == 1) {
                                  return Container(
                                    width: 26.0,
                                    height: 28.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Icon(
                                            FFIcons.kproperty1bell,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        if ((widget.aplicationDoc
                                                        ?.listIdUserAnswer !=
                                                    null &&
                                                (widget.aplicationDoc
                                                        ?.listIdUserAnswer)!
                                                    .isNotEmpty) ==
                                            true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 14.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget
                                                        .aplicationDoc
                                                        ?.listIdUserAnswer
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!),
                                          ),
                                      ],
                                    ),
                                  );
                                } else if (widget.stage == 2) {
                                  return Lottie.asset(
                                    'assets/jsons/Timer2.json',
                                    width: 28.0,
                                    height: 28.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  );
                                } else if (widget.stage == 3) {
                                  return Lottie.asset(
                                    'assets/jsons/Truck.json',
                                    width: 28.0,
                                    height: 28.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  );
                                } else if (widget.jobStatus == 'В работе') {
                                  return Lottie.asset(
                                    'assets/jsons/3leca_.json',
                                    width: 28.0,
                                    height: 28.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  );
                                } else if (widget.jobStatus == 'Завершена') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-p-e-r-e-v-o-z-v6vn3c/assets/d2ktbmqzanqs/ic_push.png',
                                      width: 28.0,
                                      height: 28.0,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return Visibility(
                                    visible: widget.aplicationDoc?.jobStatus ==
                                        'Отменена',
                                    child: Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.repeat_rounded,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
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
                                                  child: Container(
                                                    height: 170.0,
                                                    width: 440.0,
                                                    child:
                                                        CreatAnewApplicationWidget(
                                                      actionCreate: () async {
                                                        _model.newApplication =
                                                            await AplicationTable()
                                                                .insert({
                                                          'creator':
                                                              FFAppState().myID,
                                                          'city_id': widget
                                                              .aplicationDoc
                                                              ?.cityId,
                                                          'adres_street_creator':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.adresStreetCreator,
                                                          'type_cargo': widget
                                                              .aplicationDoc
                                                              ?.typeCargo,
                                                          'adress_house_creator':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.adressHouseCreator,
                                                          'desiret_date':
                                                              functions.dateToStr(
                                                                  getCurrentTimestamp),
                                                          'desiret_time':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.desiretTime,
                                                          'description': widget
                                                              .aplicationDoc
                                                              ?.description,
                                                          'payment_type':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.paymentType,
                                                          'job status':
                                                              'Создана',
                                                          'payment status':
                                                              'Не оплачена',
                                                          'company_id':
                                                              FFAppState()
                                                                  .myCompany,
                                                          'wallet_admin':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.walletAdmin,
                                                          'admin_id': widget
                                                              .aplicationDoc
                                                              ?.adminId,
                                                          'admin_company':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.adminCompany,
                                                          'lat': widget
                                                              .aplicationDoc
                                                              ?.lat,
                                                          'lon': widget
                                                              .aplicationDoc
                                                              ?.lon,
                                                          'city': widget
                                                              .aplicationDoc
                                                              ?.city,
                                                          'id_car': widget
                                                              .aplicationDoc
                                                              ?.idCar,
                                                          'id_driver': widget
                                                              .aplicationDoc
                                                              ?.idDriver,
                                                          'patronymic_driver':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.patronymicDriver,
                                                          'name_driver': widget
                                                              .aplicationDoc
                                                              ?.nameDriver,
                                                          'surname_driver':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.surnameDriver,
                                                          'phone_driver':
                                                              widget
                                                                  .aplicationDoc
                                                                  ?.phoneDriver,
                                                          'name_car': widget
                                                              .aplicationDoc
                                                              ?.nameCar,
                                                          'number_car': widget
                                                              .aplicationDoc
                                                              ?.numberCar,
                                                        });
                                                        _model.cityQuery =
                                                            await CityTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'id',
                                                            widget
                                                                .aplicationDoc
                                                                ?.cityId,
                                                          ),
                                                        );
                                                        await AplicationTable()
                                                            .update(
                                                          data: {
                                                            'namber':
                                                                '${_model.cityQuery?.firstOrNull?.abbreviature}${_model.newApplication?.id.toString()}',
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            _model
                                                                .newApplication
                                                                ?.id,
                                                          ),
                                                        );
                                                        await actions
                                                            .copyApplicationRecords(
                                                          'application_content',
                                                          widget.aplicationDoc!
                                                              .id,
                                                          _model.newApplication!
                                                              .id,
                                                        );
                                                        await actions
                                                            .copyApplicationRecords(
                                                          'works_application',
                                                          widget.aplicationDoc!
                                                              .id,
                                                          _model.newApplication!
                                                              .id,
                                                        );

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

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 14.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 7.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          dateTimeFormat(
                                            "dd.MM.yyyy",
                                            widget.createAt,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        AutoSizeText(
                                          dateTimeFormat(
                                            "HH:mm",
                                            widget.createAt,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (widget.jobStatus == 'В работе') {
                                          return FutureBuilder<List<AnswerRow>>(
                                            future:
                                                AnswerTable().querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'id',
                                                widget.idAnswer,
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<AnswerRow>
                                                  columnAnswerRowList =
                                                  snapshot.data!;

                                              final columnAnswerRow =
                                                  columnAnswerRowList.isNotEmpty
                                                      ? columnAnswerRowList
                                                          .first
                                                      : null;

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  if (functions.isLessThanTwoDays(
                                                          widget.createAt,
                                                          FFAppState()
                                                              .mySettings
                                                              .daysToHideContacts
                                                              .toString()) ??
                                                      true)
                                                    Flexible(
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          '${columnAnswerRow?.street}, ${columnAnswerRow?.house}',
                                                          'askdnjkadnvoandvkjandvkjand askd тыловт ыловт jaskdn, ad вифлова ',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 40,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        maxLines: 2,
                                                        minFontSize: 14.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: AutoSizeText(
                                                  ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoSizeText(
                                                  ' ',
                                                  textAlign: TextAlign.end,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
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
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
