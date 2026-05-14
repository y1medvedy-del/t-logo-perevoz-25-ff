import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'application_status_model.dart';
export 'application_status_model.dart';

/// контейнер статуса заявки и кнопки информации
class ApplicationStatusWidget extends StatefulWidget {
  const ApplicationStatusWidget({
    super.key,
    required this.applicationID,
    required this.action,
    required this.jobStatus,
    required this.paymentStatus,
  });

  final int? applicationID;
  final Future Function(bool info)? action;

  /// status
  final String? jobStatus;

  /// paymentStatus
  final String? paymentStatus;

  @override
  State<ApplicationStatusWidget> createState() =>
      _ApplicationStatusWidgetState();
}

class _ApplicationStatusWidgetState extends State<ApplicationStatusWidget> {
  late ApplicationStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplicationStatusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 24.0, 0.0),
      child: Container(
        width: 700.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Color(0x33000000),
              offset: Offset(
                2.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.jobStatus,
                            'status',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: () {
                              if (widget.jobStatus == 'Создана') {
                                return FlutterFlowTheme.of(context).warning;
                              } else if (widget.jobStatus == 'В работе') {
                                return FlutterFlowTheme.of(context).success;
                              } else if (widget.jobStatus == 'Завершена') {
                                return FlutterFlowTheme.of(context).primary;
                              } else {
                                return FlutterFlowTheme.of(context).error;
                              }
                            }(),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (widget.jobStatus == 'Завершена')
                    Text(
                      valueOrDefault<String>(
                        widget.paymentStatus,
                        'paymentStatus',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget.paymentStatus == 'Не оплачена'
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).success,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.infoComponent = !_model.infoComponent;
                  safeSetState(() {});
                  await widget.action?.call(
                    _model.infoComponent,
                  );
                },
                child: Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBF3FA),
                    shape: BoxShape.circle,
                  ),
                  child: Builder(
                    builder: (context) {
                      if (_model.infoComponent == false) {
                        return Icon(
                          FFIcons.kproperty1shevronDown24,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
