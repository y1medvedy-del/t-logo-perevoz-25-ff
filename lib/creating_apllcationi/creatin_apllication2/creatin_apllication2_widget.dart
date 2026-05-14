import '/backend/api_requests/api_calls.dart';
import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/window/information_dialog/information_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'creatin_apllication2_model.dart';
export 'creatin_apllication2_model.dart';

class CreatinApllication2Widget extends StatefulWidget {
  const CreatinApllication2Widget({
    super.key,
    required this.cityPageParametr,
    required this.area,
  });

  final String? cityPageParametr;

  /// область города для запроса
  final String? area;

  static String routeName = 'creatin_apllication2';
  static String routePath = 'creatinApllication2';

  @override
  State<CreatinApllication2Widget> createState() =>
      _CreatinApllication2WidgetState();
}

class _CreatinApllication2WidgetState extends State<CreatinApllication2Widget> {
  late CreatinApllication2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatinApllication2Model());

    _model.textController ??=
        TextEditingController(text: FFAppState().aplicationLocal.addressStreet);
    _model.textFieldFocusNode ??= FocusNode();

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.aCapCloseModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ACapCloseWidget(
                        text: 'Ваше местоположение',
                        creatinStage: 2,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Container(
                        width: 700.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 1.0, 1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 700.0,
                                        constraints: BoxConstraints(
                                          minHeight: 48.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                '${widget.cityPageParametr}, ${widget.area}',
                                                'null ',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
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
                                        ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      borderRadius: 10.0,
                                      buttonSize: 48.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        FFIcons.kproperty1Geo24,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        _model.geo = currentUserLocationValue;
                                        _model.conteinerAddressTextFildStreet =
                                            false;
                                        safeSetState(() {});
                                        _model.apiResultisGeo =
                                            await GeoCall.call(
                                          lat: valueOrDefault<double>(
                                            functions
                                                .geoToLadLonDouble(_model.geo)
                                                ?.firstOrNull,
                                            51.701350,
                                          ),
                                          lon: valueOrDefault<double>(
                                            functions
                                                .geoToLadLonDouble(_model.geo)
                                                ?.lastOrNull,
                                            39.170867,
                                          ),
                                          radiusMeters: 100,
                                        );

                                        if ((getJsonField(
                                                  (_model.apiResultisGeo
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.suggestions''',
                                                ) !=
                                                null) &&
                                            (getJsonField(
                                                  (_model.apiResultisGeo
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.suggestions[0].value''',
                                                ) !=
                                                null)) {
                                          safeSetState(() {
                                            _model.textController?.text =
                                                getJsonField(
                                              (_model.apiResultisGeo
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.suggestions[0].value''',
                                            ).toString();
                                          });
                                          _model.lat =
                                              functions.strToDuble(GeoCall.lat(
                                            (_model.apiResultisGeo?.jsonBody ??
                                                ''),
                                          )?.firstOrNull);
                                          _model.lon =
                                              functions.strToDuble(GeoCall.lon(
                                            (_model.apiResultisGeo?.jsonBody ??
                                                ''),
                                          )?.firstOrNull);
                                          _model.applicationStreet =
                                              functions.noNULL(getJsonField(
                                            (_model.apiResultisGeo?.jsonBody ??
                                                ''),
                                            r'''$.suggestions[0].data.street_with_type''',
                                          ).toString())!
                                                  ? getJsonField(
                                                      (_model.apiResultisGeo
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.suggestions[0].data.street_with_type''',
                                                    ).toString()
                                                  : '';
                                          _model.applicationHause = functions
                                                  .noNULL(getJsonField(
                                            (_model.apiResultisGeo?.jsonBody ??
                                                ''),
                                            r'''$.suggestions[0].data.house''',
                                          ).toString())!
                                              ? '${getJsonField(
                                                  (_model.apiResultisGeo
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.suggestions[0].data.house_type''',
                                                ).toString()} ${getJsonField(
                                                  (_model.apiResultisGeo
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.suggestions[0].data.house''',
                                                ).toString()}'
                                              : '';
                                          safeSetState(() {});
                                          _model.geo = functions.latLong(
                                              _model.lat,
                                              _model.lon?.toString());
                                          safeSetState(() {});
                                        } else {
                                          await showDialog(
                                            barrierColor: Color(0x4C000000),
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
                                                    child: Container(
                                                      width: 440.0,
                                                      child:
                                                          InformationDialogWidget(
                                                        title:
                                                            'Ошибка определения местоположения',
                                                        subtitle:
                                                            'Адрес не найден. Уточните ввод или выберите адрес вручную.',
                                                        textBlueButton: 'Ок',
                                                        actionBlueButton:
                                                            (selectBlue) async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        actionWhaitButton:
                                                            () async {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }

                                        safeSetState(() {});
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
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Container(
                                  width: 700.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'Адрес нахождения автомобиля',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 500),
                                                  () async {
                                                    _model.adrress =
                                                        await AddressCarrierTextFildCall
                                                            .call(
                                                      query:
                                                          '${widget.area} ${_model.textController.text}',
                                                    );

                                                    _model.conteinerAddressTextFildStreet =
                                                        true;
                                                    safeSetState(() {});

                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  alignLabelWithHint: false,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(8.0, 0.0,
                                                              0.0, 0.0),
                                                  suffixIcon: _model
                                                          .textController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textController
                                                                ?.clear();
                                                            _model.adrress =
                                                                await AddressCarrierTextFildCall
                                                                    .call(
                                                              query:
                                                                  '${widget.area} ${_model.textController.text}',
                                                            );

                                                            _model.conteinerAddressTextFildStreet =
                                                                true;
                                                            safeSetState(() {});

                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 22,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (_model
                                                .conteinerAddressTextFildStreet)
                                              Flexible(
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 2.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Visibility(
                                                    visible: _model
                                                        .conteinerAddressTextFildStreet,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final address =
                                                              getJsonField(
                                                            (_model.adrress
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.suggestions''',
                                                          ).toList();

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              12.0,
                                                              0,
                                                              12.0,
                                                            ),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                address.length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            8.0),
                                                            itemBuilder: (context,
                                                                addressIndex) {
                                                              final addressItem =
                                                                  address[
                                                                      addressIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.textController
                                                                            ?.text =
                                                                        '${getJsonField(
                                                                      addressItem,
                                                                      r'''$.value''',
                                                                    ).toString()}';
                                                                  });
                                                                  _model.applicationStreet =
                                                                      '${getJsonField(
                                                                    addressItem,
                                                                    r'''$.data.street_type''',
                                                                  ).toString()} ${getJsonField(
                                                                    addressItem,
                                                                    r'''$.data.street''',
                                                                  ).toString()}';
                                                                  _model
                                                                      .applicationHause = '${getJsonField(
                                                                            addressItem,
                                                                            r'''$.data.house''',
                                                                          ).toString()}' !=
                                                                          'null'
                                                                      ? '${getJsonField(
                                                                          addressItem,
                                                                          r'''$.data.house_type_full''',
                                                                        ).toString()} ${getJsonField(
                                                                          addressItem,
                                                                          r'''$.data.house''',
                                                                        ).toString()}'
                                                                      : null;
                                                                  _model.conteinerAddressTextFildStreet =
                                                                      false;
                                                                  _model.lat = functions
                                                                      .strToDuble(
                                                                          getJsonField(
                                                                    addressItem,
                                                                    r'''$.data.geo_lat''',
                                                                  ).toString());
                                                                  _model.lon = functions
                                                                      .strToDuble(
                                                                          getJsonField(
                                                                    addressItem,
                                                                    r'''$.data.geo_lon''',
                                                                  ).toString());
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            addressItem,
                                                                            r'''$.value''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            addressItem,
                                                                            r'''$.data.region_with_type''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
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
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  onPressed: ((_model.applicationStreet == null ||
                              _model.applicationStreet == '') ||
                          (_model.applicationHause == null ||
                              _model.applicationHause == '') ||
                          !functions.noNULL(_model.applicationStreet)! ||
                          !functions.noNULL(_model.applicationHause)!)
                      ? null
                      : () async {
                          FFAppState().updateAplicationLocalStruct(
                            (e) => e
                              ..addressStreet = _model.applicationStreet
                              ..addressHouse = _model.applicationHause
                              ..lat = valueOrDefault<double>(
                                _model.lat,
                                0.0,
                              )
                              ..lon = valueOrDefault<double>(
                                _model.lon,
                                0.0,
                              ),
                          );
                          safeSetState(() {});

                          context
                              .pushNamed(CreatinApllication3Widget.routeName);
                        },
                  text: 'Продолжить',
                  options: FFButtonOptions(
                    width: 700.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: FlutterFlowTheme.of(context).accent1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
