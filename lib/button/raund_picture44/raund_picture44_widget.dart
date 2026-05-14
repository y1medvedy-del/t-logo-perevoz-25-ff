import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'raund_picture44_model.dart';
export 'raund_picture44_model.dart';

class RaundPicture44Widget extends StatefulWidget {
  const RaundPicture44Widget({super.key});

  @override
  State<RaundPicture44Widget> createState() => _RaundPicture44WidgetState();
}

class _RaundPicture44WidgetState extends State<RaundPicture44Widget> {
  late RaundPicture44Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RaundPicture44Model());

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
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: Color(0xFFEBF3FA),
        shape: BoxShape.circle,
      ),
      child: Icon(
        FFIcons.kproperty1edit,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
    );
  }
}
