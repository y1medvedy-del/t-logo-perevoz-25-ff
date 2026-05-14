import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'type_payment_model.dart';
export 'type_payment_model.dart';

/// контейнер типа оплаты
class TypePaymentWidget extends StatefulWidget {
  const TypePaymentWidget({
    super.key,
    String? title,
    String? variable,
    required this.action,
    String? subtitle,
  })  : this.title = title ?? '  ',
        this.variable = variable ?? ' ',
        this.subtitle = subtitle ?? ' ';

  /// Главный заголовок
  final String title;

  /// Переменная сохраненная на странице
  final String variable;

  final Future Function()? action;

  /// Подзаголовок
  final String subtitle;

  @override
  State<TypePaymentWidget> createState() => _TypePaymentWidgetState();
}

class _TypePaymentWidgetState extends State<TypePaymentWidget> {
  late TypePaymentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TypePaymentModel());

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
        await widget.action?.call();
      },
      child: Container(
        width: 700.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: widget.title == widget.variable
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).accent2,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.title,
                      'text',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    widget.subtitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: widget.title == widget.variable
                              ? FlutterFlowTheme.of(context).secondaryText
                              : Color(0xFF989EA3),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
              if (widget.title == widget.variable)
                Icon(
                  Icons.check,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 24.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
