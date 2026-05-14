import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'save_draft_model.dart';
export 'save_draft_model.dart';

class SaveDraftWidget extends StatefulWidget {
  const SaveDraftWidget({
    super.key,
    required this.stage,
  });

  final int? stage;

  @override
  State<SaveDraftWidget> createState() => _SaveDraftWidgetState();
}

class _SaveDraftWidgetState extends State<SaveDraftWidget> {
  late SaveDraftModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveDraftModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Container(
          width: 440.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            alignment: AlignmentDirectional(1.0, -1.0),
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Предупреждение',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FutureBuilder<List<SettingsRow>>(
                          future: SettingsTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'flag',
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
                            List<SettingsRow> textSettingsRowList =
                                snapshot.data!;

                            final textSettingsRow =
                                textSettingsRowList.isNotEmpty
                                    ? textSettingsRowList.first
                                    : null;

                            return Text(
                              'Вы не завершили создание заявки. Если вы покинете страницу, все введенные данные будут потеряны. Хотите сохранить их как черновик?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().aplicationLocal.draft ==
                                      true) {
                                    FFAppState()
                                        .removeAtIndexFromLocalApplicationList(
                                            FFAppState()
                                                .aplicationLocal
                                                .draftItem);
                                    safeSetState(() {});
                                  } else {
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 100,
                                      ),
                                    );
                                  }

                                  FFAppState().aplicationLocal =
                                      AplicationLocalStruct();
                                  safeSetState(() {});

                                  context.pushNamed(General1Widget.routeName);
                                },
                                text: 'Не сохранять',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().updateAplicationLocalStruct(
                                    (e) => e..creatinStage = widget.stage,
                                  );
                                  safeSetState(() {});
                                  if (FFAppState().aplicationLocal.draft ==
                                      true) {
                                    FFAppState()
                                        .updateLocalApplicationListAtIndex(
                                      FFAppState().aplicationLocal.draftItem,
                                      (_) => FFAppState().aplicationLocal,
                                    );
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().updateAplicationLocalStruct(
                                      (e) => e..draft = true,
                                    );
                                    safeSetState(() {});
                                    FFAppState().addToLocalApplicationList(
                                        FFAppState().aplicationLocal);
                                    safeSetState(() {});
                                  }

                                  FFAppState().updateDateDraft =
                                      getCurrentTimestamp;
                                  safeSetState(() {});
                                  FFAppState().aplicationLocal =
                                      AplicationLocalStruct();
                                  safeSetState(() {});
                                  if (currentUserEmail != '') {
                                    await NotificationsTable().insert({
                                      'user_id': FFAppState().myID,
                                      'body': 'Черновик',
                                      'title': 'Сохранен новый черновик',
                                      'category': 'Заявка',
                                    });
                                  } else {
                                    context.pushNamed(
                                        General1AnanimusWidget.routeName);
                                  }

                                  Navigator.pop(context);
                                },
                                text: 'Сохранить',
                                options: FFButtonOptions(
                                  height: 40.0,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 100.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.kproperty124,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
