import '/components/star55555_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'star5_coneiner_text_model.dart';
export 'star5_coneiner_text_model.dart';

/// строка для отражения шкалы оценок отзывов
class Star5ConeinerTextWidget extends StatefulWidget {
  const Star5ConeinerTextWidget({
    super.key,
    int? assessment1,
    int? assesment2,
    required this.starSize,
    required this.starYellow,
  })  : this.assessment1 = assessment1 ?? 100,
        this.assesment2 = assesment2 ?? 0;

  final int assessment1;
  final int assesment2;
  final int? starSize;
  final int? starYellow;

  @override
  State<Star5ConeinerTextWidget> createState() =>
      _Star5ConeinerTextWidgetState();
}

class _Star5ConeinerTextWidgetState extends State<Star5ConeinerTextWidget> {
  late Star5ConeinerTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Star5ConeinerTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
            child: wrapWithModel(
              model: _model.star55555Model,
              updateCallback: () => safeSetState(() {}),
              child: Star55555Widget(
                starSaze: widget.starSize!,
                starYellow: widget.starYellow,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            child: Stack(
              children: [
                Container(
                  width: 73.0,
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFB5B5B5),
                  ),
                ),
                Container(
                  width: functions.conteinerScail(
                      widget.assessment1, widget.assesment2, 73),
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ],
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.assesment2.toString(),
              '0',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Color(0xFFB5B5B5),
                  fontSize: 11.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}
