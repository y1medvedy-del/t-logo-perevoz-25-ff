import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profil/profil_camera_and_galery/profil_camera_and_galery_widget.dart';
import '/profil/row_next_text_icon/row_next_text_icon_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profil1_model.dart';
export 'profil1_model.dart';

class Profil1Widget extends StatefulWidget {
  const Profil1Widget({super.key});

  static String routeName = 'profil1';
  static String routePath = 'profil1';

  @override
  State<Profil1Widget> createState() => _Profil1WidgetState();
}

class _Profil1WidgetState extends State<Profil1Widget> {
  late Profil1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Profil1Model());

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
                          model: _model.returneMenuModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ReturneMenuWidget(
                            text: 'Профиль',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FutureBuilder<List<CompanyRow>>(
                              future: _model.company(
                                requestFn: () => CompanyTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    FFAppState().myCompany,
                                  ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CompanyRow> containerCompanyRowList =
                                    snapshot.data!;

                                final containerCompanyRow =
                                    containerCompanyRowList.isNotEmpty
                                        ? containerCompanyRowList.first
                                        : null;

                                return Container(
                                  width: 700.0,
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<List<UserRow>>(
                                    future: UserTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        FFAppState().myID,
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
                                      List<UserRow> columnUserRowList =
                                          snapshot.data!;

                                      final columnUserRow =
                                          columnUserRowList.isNotEmpty
                                              ? columnUserRowList.first
                                              : null;

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 38.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (valueOrDefault<bool>(
                                                    containerCompanyRow
                                                            ?.contract ==
                                                        false,
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: 700.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Договор заключен',
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
                                                                      .primary,
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
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  1.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.queryChatAdmin =
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
                                                          if (_model.queryChatAdmin !=
                                                                  null &&
                                                              (_model.queryChatAdmin)!
                                                                  .isNotEmpty) {
                                                            context.pushNamed(
                                                              Chat3AdminWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'idChat':
                                                                    serializeParam(
                                                                  _model
                                                                      .queryChatAdmin
                                                                      ?.firstOrNull
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                                'textMessage':
                                                                    serializeParam(
                                                                  'Запрос на заключение договора!',
                                                                  ParamType
                                                                      .String,
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
                                                                'textMessage':
                                                                    serializeParam(
                                                                  'Запрос на заключение договора!',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            'Заключить договор',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 700.0,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    width: 400.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  22.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 72.0,
                                                            height: 72.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  width: 72.0,
                                                                  height: 72.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kproperty1user,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                ),
                                                                if (columnUserRow
                                                                            ?.avatar !=
                                                                        null &&
                                                                    columnUserRow
                                                                            ?.avatar !=
                                                                        '')
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        columnUserRow
                                                                            ?.avatar,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-p-e-r-e-v-o-z-v6vn3c/assets/jfr6i6l7s4ui/Icn_(16).png',
                                                                      ),
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
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
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                                    child: ProfilCameraAndGaleryWidget(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              14.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Рейтинг',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  FFIcons.kstar,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnUserRow
                                                                      ?.rating
                                                                      ?.toString(),
                                                                  '0',
                                                                ),
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
                                                                      fontSize:
                                                                          18.0,
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
                                                            ],
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                ProfilReviewsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'rating':
                                                                      serializeParam(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      columnUserRow
                                                                          ?.rating,
                                                                      0.0,
                                                                    ),
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: 'Отзывы',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Фамилия',
                                                    text2:
                                                        columnUserRow?.surname,
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                        ProfilEditSurnameWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'surname':
                                                              serializeParam(
                                                            columnUserRow
                                                                ?.surname,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Имя',
                                                    text2: columnUserRow?.name,
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                        ProfilEditNameWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'name':
                                                              serializeParam(
                                                            columnUserRow?.name,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Отчество',
                                                    text2: columnUserRow
                                                        ?.patronymic,
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                        ProfilEditPatronymicWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'patronymic':
                                                              serializeParam(
                                                            columnUserRow
                                                                ?.patronymic,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel4,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Телефон',
                                                    text2: columnUserRow
                                                        ?.phoneUser,
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                        ProfilEditPhoneWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'phone':
                                                              serializeParam(
                                                            columnUserRow
                                                                ?.phoneUser,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel5,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Email',
                                                    text2: columnUserRow?.email,
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                        ProfilEditEmailWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'email':
                                                              serializeParam(
                                                            columnUserRow
                                                                ?.email,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel6,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Компания',
                                                    text2: columnUserRow
                                                        ?.nameCompany,
                                                    actionRow: () async {
                                                      _model.queryCompany =
                                                          await CompanyTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'id',
                                                          FFAppState()
                                                              .myCompany,
                                                        ),
                                                      );
                                                      if (containerCompanyRow
                                                              ?.type ==
                                                          'ООО') {
                                                        context.pushNamed(
                                                            ProfilRecvisitesCompanyOooWidget
                                                                .routeName);
                                                      } else if (containerCompanyRow
                                                              ?.type ==
                                                          'ИП') {
                                                        context.pushNamed(
                                                            ProfilRecvisitesCompanyIpWidget
                                                                .routeName);
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                                if (!columnUserRow!.fizLico!)
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextIconModel7,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        RowNextTextIconWidget(
                                                      text1:
                                                          'Мои автомобили и сотрудники',
                                                      text2: ' ',
                                                      actionRow: () async {
                                                        context.pushNamed(
                                                            ProfilAddEmployeWidget
                                                                .routeName);
                                                      },
                                                    ),
                                                  ),
                                                wrapWithModel(
                                                  model: _model
                                                      .rowNextTextIconModel8,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextIconWidget(
                                                    text1: 'Мои документы',
                                                    text2: ' ',
                                                    actionRow: () async {
                                                      context.pushNamed(
                                                          ProfilDocumentWidget
                                                              .routeName);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      16.0,
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .height
                                                            ? 104.0
                                                            : 22.0,
                                                        0.0,
                                                      )),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Flexible(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          Enter4NewPasswordWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'email':
                                                                serializeParam(
                                                              currentUserEmail,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: 'Изменить пароль',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      Function() _navigate =
                                                          () {};
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Выход из аккаунта'),
                                                                      content: Text(
                                                                          'Вы уверены, что хотите выйти из аккаунта? Некоторые функции приложения будут недоступны без авторизации.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Отмена'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Выйти'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        await authManager
                                                            .signOut();
                                                        GoRouter.of(context)
                                                            .clearRedirectLocation();

                                                        _navigate = () =>
                                                            context.goNamedAuth(
                                                                Onbording1Widget
                                                                    .routeName,
                                                                context
                                                                    .mounted);
                                                      }

                                                      _navigate();
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons.logout,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      FFIcons.kproperty1trash24,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
