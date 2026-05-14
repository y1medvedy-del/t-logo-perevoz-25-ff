import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'star55555_model.dart';
export 'star55555_model.dart';

class Star55555Widget extends StatefulWidget {
  const Star55555Widget({
    super.key,
    int? starSaze,
    int? starYellow,
  })  : this.starSaze = starSaze ?? 24,
        this.starYellow = starYellow ?? 0;

  final int starSaze;
  final int starYellow;

  @override
  State<Star55555Widget> createState() => _Star55555WidgetState();
}

class _Star55555WidgetState extends State<Star55555Widget> {
  late Star55555Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Star55555Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              FFIcons.kproperty1starBig,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: widget.starSaze.toDouble(),
            ),
            Icon(
              FFIcons.kproperty1starBig,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: widget.starSaze.toDouble(),
            ),
            Icon(
              FFIcons.kproperty1starBig,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: widget.starSaze.toDouble(),
            ),
            Icon(
              FFIcons.kproperty1starBig,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: widget.starSaze.toDouble(),
            ),
            Icon(
              FFIcons.kproperty1starBig,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: widget.starSaze.toDouble(),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.starYellow > 0)
              Icon(
                FFIcons.kstar,
                color: FlutterFlowTheme.of(context).warning,
                size: widget.starSaze.toDouble(),
              ),
            if (widget.starYellow > 1)
              Icon(
                FFIcons.kstar,
                color: FlutterFlowTheme.of(context).warning,
                size: widget.starSaze.toDouble(),
              ),
            if (widget.starYellow > 2)
              Icon(
                FFIcons.kstar,
                color: FlutterFlowTheme.of(context).warning,
                size: widget.starSaze.toDouble(),
              ),
            if (widget.starYellow > 3)
              Icon(
                FFIcons.kstar,
                color: FlutterFlowTheme.of(context).warning,
                size: widget.starSaze.toDouble(),
              ),
            if (widget.starYellow > 4)
              Icon(
                FFIcons.kstar,
                color: FlutterFlowTheme.of(context).warning,
                size: widget.starSaze.toDouble(),
              ),
          ],
        ),
      ],
    );
  }
}
