import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/save_draft/save_draft_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_application_payment_type_accaut_payment_model.dart';
export 'create_application_payment_type_accaut_payment_model.dart';

class CreateApplicationPaymentTypeAccautPaymentWidget extends StatefulWidget {
  const CreateApplicationPaymentTypeAccautPaymentWidget({
    super.key,
    this.stage,
  });

  final int? stage;

  @override
  State<CreateApplicationPaymentTypeAccautPaymentWidget> createState() =>
      _CreateApplicationPaymentTypeAccautPaymentWidgetState();
}

class _CreateApplicationPaymentTypeAccautPaymentWidgetState
    extends State<CreateApplicationPaymentTypeAccautPaymentWidget> {
  late CreateApplicationPaymentTypeAccautPaymentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CreateApplicationPaymentTypeAccautPaymentModel());

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
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Оплата по счету',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Оплату по счету могут выбрать пользователи, заключившие договор. \nСвязаться со службой поддержки для заключения договора?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Отменить',
                        options: FFButtonOptions(
                          width: 119.0,
                          height: 40.0,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            _model.chatAdmin = await ChatTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'user carrier',
                                    FFAppState().myID,
                                  )
                                  .eqOrNull(
                                    'chat_admin',
                                    true,
                                  ),
                            );
                            if (_model.chatAdmin != null &&
                                (_model.chatAdmin)!.isNotEmpty) {
                              if (widget.stage != null) {
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
                                        child: SaveDraftWidget(
                                          stage: widget.stage!,
                                        ),
                                      ),
                                    );
                                  },
                                );

                                context.pushNamed(
                                  Chat3AdminWidget.routeName,
                                  queryParameters: {
                                    'idChat': serializeParam(
                                      _model.chatAdmin?.firstOrNull?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(
                                  Chat3AdminWidget.routeName,
                                  queryParameters: {
                                    'idChat': serializeParam(
                                      _model.chatAdmin?.firstOrNull?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            } else {
                              _model.newChat = await ChatTable().insert({
                                'user carrier': FFAppState().myID,
                                'chat_admin': true,
                              });
                              if (widget.stage != null) {
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
                                        child: SaveDraftWidget(
                                          stage: widget.stage!,
                                        ),
                                      ),
                                    );
                                  },
                                );

                                context.pushNamed(
                                  Chat3AdminWidget.routeName,
                                  queryParameters: {
                                    'idChat': serializeParam(
                                      _model.newChat?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(
                                  Chat3AdminWidget.routeName,
                                  queryParameters: {
                                    'idChat': serializeParam(
                                      _model.newChat?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'Связаться',
                          options: FFButtonOptions(
                            width: 119.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
