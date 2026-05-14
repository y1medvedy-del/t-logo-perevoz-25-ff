import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profil/row_next_text/row_next_text_widget.dart';
import '/profil/row_next_text_icon/row_next_text_icon_widget.dart';
import '/profil/window_bloking_employe/window_bloking_employe_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profil_employe_model.dart';
export 'profil_employe_model.dart';

class ProfilEmployeWidget extends StatefulWidget {
  const ProfilEmployeWidget({
    super.key,
    required this.idEmploye,
  });

  final int? idEmploye;

  static String routeName = 'profil_employe';
  static String routePath = 'profilEmploye';

  @override
  State<ProfilEmployeWidget> createState() => _ProfilEmployeWidgetState();
}

class _ProfilEmployeWidgetState extends State<ProfilEmployeWidget> {
  late ProfilEmployeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilEmployeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            text: 'Профиль сотрудника',
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FutureBuilder<List<UserRow>>(
                              future: UserTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  widget.idEmploye,
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
                                List<UserRow> containerUserRowList =
                                    snapshot.data!;

                                final containerUserRow =
                                    containerUserRowList.isNotEmpty
                                        ? containerUserRowList.first
                                        : null;

                                return Container(
                                  width: 700.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  MediaQuery.sizeOf(context)
                                                      .height
                                              ? 52.0
                                              : 30.0,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              wrapWithModel(
                                                model: _model.rowNextTextModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextWidget(
                                                  text1: 'Фамилия',
                                                  text2:
                                                      containerUserRow?.surname,
                                                  actionRow: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.rowNextTextModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextWidget(
                                                  text1: 'Имя',
                                                  text2: containerUserRow?.name,
                                                  actionRow: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.rowNextTextModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextWidget(
                                                  text1: 'Отчество',
                                                  text2: containerUserRow
                                                      ?.patronymic,
                                                  actionRow: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.rowNextTextModel4,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextWidget(
                                                  text1: 'Телефон',
                                                  text2: containerUserRow
                                                      ?.phoneUser,
                                                  actionRow: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.rowNextTextModel5,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextWidget(
                                                  text1: 'Email',
                                                  text2:
                                                      containerUserRow?.email,
                                                  actionRow: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.rowNextTextIconModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RowNextTextIconWidget(
                                                  text1: 'Должность',
                                                  text2: containerUserRow
                                                      ?.position,
                                                  actionRow: () async {
                                                    context.pushNamed(
                                                      ProfilEditPostEmployeWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'idEmploye':
                                                            serializeParam(
                                                          widget.idEmploye,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 43.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
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
                                                                    WindowBlokingEmployeWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text:
                                                        'Заблокировать сотрудника',
                                                    options: FFButtonOptions(
                                                      width: 350.0,
                                                      height: 40.0,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
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
                                                                color: Color(
                                                                    0xFFCD3C3C),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
