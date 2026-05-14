import '/backend/supabase/supabase.dart';
import '/creating_apllcationi/singl_and_stamp_application/singl_and_stamp_application_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'creatin_apllication8_model.dart';
export 'creatin_apllication8_model.dart';

class CreatinApllication8Widget extends StatefulWidget {
  const CreatinApllication8Widget({
    super.key,
    required this.aplicationDoc,
  });

  /// строка заявки
  final AplicationRow? aplicationDoc;

  static String routeName = 'creatin_apllication8';
  static String routePath = 'creatinApllication8';

  @override
  State<CreatinApllication8Widget> createState() =>
      _CreatinApllication8WidgetState();
}

class _CreatinApllication8WidgetState extends State<CreatinApllication8Widget> {
  late CreatinApllication8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatinApllication8Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SinglAndStampApplicationWidget(
                  text1: 'Создание бланка заявки ',
                  text2: '',
                  signatureAndStamp: (signatureAndStamp) async {
                    _model.signatureAndStamp = signatureAndStamp;
                    safeSetState(() {});
                    _model.urlDocApplicationBlanc =
                        await actions.createApplicationDocPdf(
                      widget.aplicationDoc!.id,
                      'Blanc_1_step_${widget.aplicationDoc?.namber}_${dateTimeFormat(
                        "dd.MM.yyyy_h.mm",
                        getCurrentTimestamp,
                        locale: FFLocalizations.of(context).languageCode,
                      )}',
                      'blanc_application',
                      signatureAndStamp,
                      false,
                      false,
                    );
                    await ApplicationBlancDocTable().insert({
                      'application_id': widget.aplicationDoc?.id,
                      'stamp_and_signature': 1,
                      'name_doc':
                          'Заявка (акт) на выполнение Погрузо-разгрузочных работ № ${widget.aplicationDoc?.namber} от ${dateTimeFormat(
                        "dd.MM.yyyy ",
                        getCurrentTimestamp,
                        locale: FFLocalizations.of(context).languageCode,
                      )}',
                      'link_doc': _model.urlDocApplicationBlanc,
                    });
                  },
                ),
              ),
            ),
          );
        },
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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: 700.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 0.0),
                                child: AutoSizeText(
                                  'Заявка успешно создана!',
                                  textAlign: TextAlign.center,
                                  minFontSize: 16.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 8.0, 24.0, 24.0),
                                child: Text(
                                  'Мы отправили вашу заявку складам и они  уже начали готовить свои предложения',
                                  textAlign: TextAlign.center,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 0),
                              fadeOutDuration: Duration(milliseconds: 0),
                              imageUrl:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/nt1triny93n9/Deliveryman-making-notes-near-parcels_1.png',
                              width: 382.0,
                              fit: BoxFit.contain,
                            ),
                          ),
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
                          onPressed: () async {
                            context.pushNamed(General1Widget.routeName);
                          },
                          text: 'На главную',
                          options: FFButtonOptions(
                            width: 700.0,
                            height: 44.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
