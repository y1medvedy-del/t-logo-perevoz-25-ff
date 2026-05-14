import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button70048_blue_model.dart';
export 'button70048_blue_model.dart';

class Button70048BlueWidget extends StatefulWidget {
  const Button70048BlueWidget({
    super.key,
    required this.text,
    bool? flagButton,
    required this.actionButton,
  }) : this.flagButton = flagButton ?? false;

  final String? text;
  final bool flagButton;
  final Future Function()? actionButton;

  @override
  State<Button70048BlueWidget> createState() => _Button70048BlueWidgetState();
}

class _Button70048BlueWidgetState extends State<Button70048BlueWidget> {
  late Button70048BlueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Button70048BlueModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: widget.flagButton
          ? null
          : () async {
              unawaited(
                () async {
                  await widget.actionButton?.call();
                }(),
              );
            },
      text: widget.text!,
      options: FFButtonOptions(
        width: 700.0,
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
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
        elevation: 3.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        disabledColor: FlutterFlowTheme.of(context).accent1,
      ),
    );
  }
}
