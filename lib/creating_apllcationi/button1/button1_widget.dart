import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button1_model.dart';
export 'button1_model.dart';

class Button1Widget extends StatefulWidget {
  const Button1Widget({
    super.key,
    required this.text,
    required this.activButton,
  });

  final String? text;
  final bool? activButton;

  @override
  State<Button1Widget> createState() => _Button1WidgetState();
}

class _Button1WidgetState extends State<Button1Widget> {
  late Button1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Button1Model());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: FFButtonWidget(
        onPressed: !widget.activButton!
            ? null
            : () async {
                Navigator.pop(context);
              },
        text: widget.text!,
        options: FFButtonOptions(
          width: 382.0,
          height: 48.0,
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0xFF0C71C3),
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.montserrat(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: Colors.white,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          disabledColor: Color(0xFF85B7E0),
        ),
      ),
    );
  }
}
