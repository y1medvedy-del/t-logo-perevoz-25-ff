import '/apllication/a_cap_cancel/a_cap_cancel_widget.dart';
import '/apllication/aplication_filter_mobil/aplication_filter_mobil_widget.dart';
import '/apllication/aplication_filter_web/aplication_filter_web_widget.dart';
import '/apllication/application_status/application_status_widget.dart';
import '/apllication/info_application/info_application_widget.dart';
import '/apllication/info_work/info_work_widget.dart';
import '/apllication/row_icon_text/row_icon_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'apllication1_model.dart';
export 'apllication1_model.dart';

class Apllication1Widget extends StatefulWidget {
  const Apllication1Widget({
    super.key,
    required this.idAplication,
    this.info,
  });

  final int? idAplication;
  final bool? info;

  static String routeName = 'apllication1';
  static String routePath = 'apllication1';

  @override
  State<Apllication1Widget> createState() => _Apllication1WidgetState();
}

class _Apllication1WidgetState extends State<Apllication1Widget> {
  late Apllication1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Apllication1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.markupCompany = await MarkupPraceTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'company_id',
          FFAppState().myCompany,
        ),
      );
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

    return StreamBuilder<List<AplicationRow>>(
      stream: _model.apllication1SupabaseStream ??= SupaFlow.client
          .from("aplication")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'id',
            widget.idAplication,
          )
          .map((list) => list.map((item) => AplicationRow(item)).toList()),
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
        List<AplicationRow> apllication1AplicationRowList = snapshot.data!;

        final apllication1AplicationRow =
            apllication1AplicationRowList.isNotEmpty
                ? apllication1AplicationRowList.first
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
              child: Column(
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
                            applicationID: widget.idAplication!,
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
                                    applicationID: widget.idAplication!,
                                    jobStatus:
                                        apllication1AplicationRow!.jobStatus!,
                                    paymentStatus: apllication1AplicationRow
                                        .paymentStatus!,
                                    action: (info) async {
                                      _model.info = info;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                                if (_model.info)
                                  wrapWithModel(
                                    model: _model.infoApplicationModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InfoApplicationWidget(
                                      idApplication:
                                          apllication1AplicationRow.id,
                                      applicationDoc:
                                          apllication1AplicationRow,
                                    ),
                                  ),
                                StreamBuilder<List<AnswerRow>>(
                                  stream: _model
                                          .conditionalBuilderSupabaseStream ??=
                                      SupaFlow.client
                                          .from("answer")
                                          .stream(primaryKey: ['id'])
                                          .eqOrNull(
                                            'application_id',
                                            widget.idAplication,
                                          )
                                          .order('id')
                                          .map((list) => list
                                              .map((item) => AnswerRow(item))
                                              .toList()),
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
                                    List<AnswerRow>
                                        conditionalBuilderAnswerRowList =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        if (conditionalBuilderAnswerRowList
                                            .isNotEmpty) {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 30.0,
                                                          24.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width: 700.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Отклики на заявку',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (MediaQuery.sizeOf(context).width >
                                                                              MediaQuery.sizeOf(context).height) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 430.0,
                                                                                        child: AplicationFilterWebWidget(
                                                                                          filterDistantion: valueOrDefault<double>(
                                                                                            _model.filterDistantion,
                                                                                            0.0,
                                                                                          ),
                                                                                          filterPrice: valueOrDefault<int>(
                                                                                            _model.filterPrice,
                                                                                            0,
                                                                                          ),
                                                                                          filterFaivorites: _model.filterFaivorites,
                                                                                          actionFilter: (filterDistantion, filterPrice, filterFaivorites) async {
                                                                                            _model.filterDistantion = filterDistantion;
                                                                                            _model.filterPrice = filterPrice;
                                                                                            _model.filterFaivorites = filterFaivorites;
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                  child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 455.0,
                                                                                        child: AplicationFilterMobilWidget(
                                                                                          filterDistance: _model.filterDistantion,
                                                                                          filterPrice: _model.filterPrice,
                                                                                          filterFaivorites: _model.filterFaivorites,
                                                                                          actionFiltr: (distantion, price, faivorites) async {
                                                                                            _model.filterDistantion = distantion;
                                                                                            _model.filterPrice = price;
                                                                                            _model.filterFaivorites = faivorites;
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                        child:
                                                                            wrapWithModel(
                                                                          model:
                                                                              _model.button4848Model,
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              Button4848Widget(
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.kproperty1Icons,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if ((_model.filterFaivorites ==
                                                                            true) ||
                                                                        ((_model.filterPrice !=
                                                                                null) &&
                                                                            (_model.filterPrice! >
                                                                                0)) ||
                                                                        ((_model.filterDistantion !=
                                                                                null) &&
                                                                            (_model.filterDistantion! >
                                                                                0.0)))
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(6.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              8.0,
                                                                          height:
                                                                              8.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).warning,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 700.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final answerList = conditionalBuilderAnswerRowList
                                                                .map((e) => e)
                                                                .toList()
                                                                .where((e) =>
                                                                    ((_model.filterPrice == null) ||
                                                                        (_model.filterPrice ==
                                                                            0) ||
                                                                        (_model.filterPrice! >=
                                                                            e
                                                                                .price!)) &&
                                                                    ((_model.filterDistantion == null) ||
                                                                        (_model.filterDistantion ==
                                                                            0.0) ||
                                                                        (_model.filterDistantion! >=
                                                                            functions.distantionKM(
                                                                                apllication1AplicationRow
                                                                                    .lat,
                                                                                apllication1AplicationRow
                                                                                    .lon,
                                                                                e
                                                                                    .lat,
                                                                                e
                                                                                    .lon)!) ||
                                                                        ((apllication1AplicationRow.lat == null) ||
                                                                            (apllication1AplicationRow.lon ==
                                                                                null) ||
                                                                            (e.lat ==
                                                                                null) ||
                                                                            (e.lon ==
                                                                                null))) &&
                                                                    ((_model
                                                                                .filterFaivorites ==
                                                                            null) ||
                                                                        (_model.filterFaivorites ==
                                                                            false) ||
                                                                        (e.favourites.contains(FFAppState().myID) ==
                                                                            true)))
                                                                .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                100.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  answerList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          16.0),
                                                              itemBuilder: (context,
                                                                  answerListIndex) {
                                                                final answerListItem =
                                                                    answerList[
                                                                        answerListIndex];
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            700.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF5F7FA),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFD0D5D8),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              16.0,
                                                                              12.0,
                                                                              16.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              RowIconTextWidget(
                                                                                key: Key('Keyhzf_${answerListIndex}_of_${answerList.length}'),
                                                                                icon: Icon(
                                                                                  FFIcons.kproperty1calendar,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                text1: 'Дата и время',
                                                                                text2: '${answerListItem.suggestedDate},  ${answerListItem.suggestedTime}',
                                                                                iconInfo: false,
                                                                                newPrace: false,
                                                                                action: () async {},
                                                                              ),
                                                                              RowIconTextWidget(
                                                                                key: Key('Keyu8j_${answerListIndex}_of_${answerList.length}'),
                                                                                icon: Icon(
                                                                                  FFIcons.kproperty1Geo24,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                text1: 'Адрес склада',
                                                                                text2: valueOrDefault<String>(
                                                                                  answerListItem.street,
                                                                                  'адрес',
                                                                                ),
                                                                                text4: functions.distantionStr(functions.distantionKM(apllication1AplicationRow.lat, apllication1AplicationRow.lon, answerListItem.lat, answerListItem.lon)),
                                                                                iconInfo: false,
                                                                                newPrace: false,
                                                                                action: () async {},
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => RowIconTextWidget(
                                                                                  key: Key('Key5xg_${answerListIndex}_of_${answerList.length}'),
                                                                                  icon: Icon(
                                                                                    FFIcons.kproperty1rubleSvgrepoCom11,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                  text1: 'Сумма, предложенная складом',
                                                                                  text2: '${(valueOrDefault<int>(
                                                                                        answerListItem.price,
                                                                                        0,
                                                                                      ) + (valueOrDefault<int>(
                                                                                            answerListItem.price,
                                                                                            0,
                                                                                          ) * valueOrDefault<int>(
                                                                                            _model.markupCompany?.firstOrNull?.procent,
                                                                                            0,
                                                                                          ) / 100)).toString()}  ₽',
                                                                                  iconInfo: true,
                                                                                  newPrace: false,
                                                                                  action: () async {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: InfoWorkWidget(
                                                                                                idAnswer: answerListItem.id,
                                                                                                markup: valueOrDefault<int>(
                                                                                                  _model.markupCompany?.firstOrNull?.procent,
                                                                                                  0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              FutureBuilder<List<UserRow>>(
                                                                                future: UserTable().querySingleRow(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'id',
                                                                                    answerListItem.createUser,
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
                                                                                  List<UserRow> containerUserRowList = snapshot.data!;

                                                                                  final containerUserRow = containerUserRowList.isNotEmpty ? containerUserRowList.first : null;

                                                                                  return Container(
                                                                                    width: 700.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Visibility(
                                                                                      visible: containerUserRow?.rating != null,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              AplicationReviewsWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'idCreatorAnsver': serializeParam(
                                                                                                  answerListItem.createUser,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                                'idAnswer': serializeParam(
                                                                                                  answerListItem.id,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                                'priceAnswer': serializeParam(
                                                                                                  answerListItem.price,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                                'idApplication': serializeParam(
                                                                                                  widget.idAplication,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/3lmcas1y749y/Icn_(13).png',
                                                                                                    width: 24.0,
                                                                                                    height: 24.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerUserRow?.rating?.toString(),
                                                                                                    '1',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                'Смотреть отзывы',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(10.0),
                                                                                                    child: Icon(
                                                                                                      Icons.chevron_right_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(1.0, -1.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await AplicationTable().update(
                                                                                              data: {
                                                                                                'price': answerListItem.price,
                                                                                                'answer': answerListItem.id,
                                                                                                'answer_user_select': answerListItem.createUser,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id',
                                                                                                widget.idAplication,
                                                                                              ),
                                                                                            );

                                                                                            context.pushNamed(
                                                                                              Apllication2Widget.routeName,
                                                                                              queryParameters: {
                                                                                                'idApplication': serializeParam(
                                                                                                  widget.idAplication,
                                                                                                  ParamType.int,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          text: 'Подтвердить',
                                                                                          options: FFButtonOptions(
                                                                                            width: 140.0,
                                                                                            height: 40.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).accent3,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  if (answerListItem.favourites.contains(apllication1AplicationRow.creator)) {
                                                                                    return FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await AnswerTable().update(
                                                                                          data: {
                                                                                            'favourites': functions.addOrRemoveItemID(answerListItem.favourites.toList(), apllication1AplicationRow.creator, false),
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            answerListItem.id,
                                                                                          ),
                                                                                        );

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: '',
                                                                                      icon: Icon(
                                                                                        Icons.favorite_rounded,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: FlutterFlowTheme.of(context).error,
                                                                                        color: Color(0x00F5F7FA),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await AnswerTable().update(
                                                                                          data: {
                                                                                            'favourites': functions.addOrRemoveItemID(answerListItem.favourites.toList(), FFAppState().myID, true),
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            answerListItem.id,
                                                                                          ),
                                                                                        );

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: '',
                                                                                      icon: Icon(
                                                                                        Icons.favorite_border,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: FlutterFlowTheme.of(context).error,
                                                                                        color: Color(0x00F5F7FA),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
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
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.7,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 30.0,
                                                          24.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 700.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Ожидайте отклики по вашей заявке',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width >
                                                                                MediaQuery.sizeOf(context).height
                                                                            ? 22.0
                                                                            : 4.0,
                                                                        0.0,
                                                                      ),
                                                                      0.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Можете закрыть приложение, мы пришлем вам уведомление',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context).width >
                                                                              MediaQuery.sizeOf(context).height
                                                                          ? 40.0
                                                                          : 22.0,
                                                                      0.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 700.0,
                                                          height: 292.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF5F7FA),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFD0D5D8),
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              200),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              200),
                                                                  imageUrl:
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/u7mi6giq5mps/sandglass_8iqhesqceofh_1.png',
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
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
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
          ),
        );
      },
    );
  }
}
