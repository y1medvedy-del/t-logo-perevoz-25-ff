import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'info_switch_model.dart';
export 'info_switch_model.dart';

class InfoSwitchWidget extends StatefulWidget {
  const InfoSwitchWidget({
    super.key,
    bool? infoSwitch,
  }) : this.infoSwitch = infoSwitch ?? false;

  final bool infoSwitch;

  @override
  State<InfoSwitchWidget> createState() => _InfoSwitchWidgetState();
}

class _InfoSwitchWidgetState extends State<InfoSwitchWidget> {
  late InfoSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoSwitchModel());

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
      child: Builder(
        builder: (context) {
          if (widget.infoSwitch) {
            return Icon(
              Icons.keyboard_arrow_down,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            );
          } else {
            return Icon(
              FFIcons.kproperty1shevronUp24,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            );
          }
        },
      ),
    );
  }
}
