import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

/// значек уведомления индикатор
class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({
    super.key,
    required this.quantity,
    this.color,
  });

  /// колличество уведомлений
  final int? quantity;

  /// ели надо поменять цвет индикатора передать в параметрах
  final Color? color;

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.quantity! > 0,
      child: badges.Badge(
        badgeContent: Text(
          valueOrDefault<String>(
            widget.quantity?.toString(),
            '0',
          ).maybeHandleOverflow(
            maxChars: 3,
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.montserrat(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: Colors.white,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
        ),
        showBadge: true,
        shape: badges.BadgeShape.circle,
        badgeColor: valueOrDefault<Color>(
          widget.color != null
              ? widget.color
              : FlutterFlowTheme.of(context).error,
          FlutterFlowTheme.of(context).error,
        ),
        elevation: 4.0,
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        position: badges.BadgePosition.topEnd(),
        animationType: badges.BadgeAnimationType.scale,
        toAnimate: true,
      ),
    );
  }
}
