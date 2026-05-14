import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button_white_model.dart';
export 'button_white_model.dart';

class ButtonWhiteWidget extends StatefulWidget {
  const ButtonWhiteWidget({
    super.key,
    required this.text,
    Color? color,
    this.actionButtonWhite,
  }) : this.color = color ?? Colors.white;

  final String? text;
  final Color color;
  final Future Function()? actionButtonWhite;

  @override
  State<ButtonWhiteWidget> createState() => _ButtonWhiteWidgetState();
}

class _ButtonWhiteWidgetState extends State<ButtonWhiteWidget> {
  late ButtonWhiteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonWhiteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.actionButtonWhite?.call();
      },
      child: Container(
        width: 700.0,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width >
                          MediaQuery.sizeOf(context).height
                      ? 169.0
                      : 10.0,
                  0.0,
                ),
                10.0,
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width >
                          MediaQuery.sizeOf(context).height
                      ? 169.0
                      : 10.0,
                  0.0,
                ),
                10.0),
            child: Text(
              widget.text!,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
