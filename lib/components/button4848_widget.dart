import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'button4848_model.dart';
export 'button4848_model.dart';

class Button4848Widget extends StatefulWidget {
  const Button4848Widget({
    super.key,
    required this.icon,
    Color? colorButton,
  }) : this.colorButton = colorButton ?? const Color(0xFFF5F7FA);

  final Widget? icon;

  /// цвет кнопки
  final Color colorButton;

  @override
  State<Button4848Widget> createState() => _Button4848WidgetState();
}

class _Button4848WidgetState extends State<Button4848Widget> {
  late Button4848Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Button4848Model());

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
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: widget.colorButton,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent2,
        ),
      ),
      child: widget.icon!,
    );
  }
}
