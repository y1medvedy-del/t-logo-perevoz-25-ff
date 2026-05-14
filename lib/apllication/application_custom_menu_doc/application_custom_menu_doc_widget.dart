import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'application_custom_menu_doc_model.dart';
export 'application_custom_menu_doc_model.dart';

/// выподающее меню на документах
class ApplicationCustomMenuDocWidget extends StatefulWidget {
  const ApplicationCustomMenuDocWidget({
    super.key,
    this.actionButton1,
    this.actionButton2,
    this.actionButtonDelite,
    bool? downloadXML,
    bool? downloadPDF,
    bool? buttonDelite,
  })  : this.downloadXML = downloadXML ?? false,
        this.downloadPDF = downloadPDF ?? false,
        this.buttonDelite = buttonDelite ?? false;

  final Future Function()? actionButton1;
  final Future Function()? actionButton2;

  /// Кнопка удаления
  final Future Function()? actionButtonDelite;

  /// Видимость кнопки скачать XML
  final bool downloadXML;

  /// Видимость кнопки скачать PDF
  final bool downloadPDF;

  /// Видимость кнопки удалить
  final bool buttonDelite;

  @override
  State<ApplicationCustomMenuDocWidget> createState() =>
      _ApplicationCustomMenuDocWidgetState();
}

class _ApplicationCustomMenuDocWidgetState
    extends State<ApplicationCustomMenuDocWidget> {
  late ApplicationCustomMenuDocModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplicationCustomMenuDocModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Visibility(
                visible: widget.downloadXML,
                child: Container(
                  decoration: BoxDecoration(
                    color: _model.mouseRegionHovered1
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.actionButton1?.call();
                    },
                    text: 'Скачать XML',
                    icon: Icon(
                      FFIcons.kproperty1download,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).primary,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      hoverColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
              }),
            ),
            if (widget.downloadXML)
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                ),
              ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Visibility(
                visible: widget.downloadPDF,
                child: Container(
                  decoration: BoxDecoration(
                    color: _model.mouseRegionHovered2
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.actionButton2?.call();
                    },
                    text: 'Скачать PDF',
                    icon: Icon(
                      FFIcons.kproperty1download,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).primary,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      hoverColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
              }),
            ),
            if (widget.buttonDelite)
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                ),
              ),
            if (widget.buttonDelite)
              MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer ?? MouseCursor.defer,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.actionButtonDelite?.call();
                    },
                    text: 'Удалить        ',
                    icon: Icon(
                      FFIcons.kproperty1trash24,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).error,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      hoverColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered3 = true);
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered3 = false);
                }),
              ),
          ],
        ),
      ),
    );
  }
}
