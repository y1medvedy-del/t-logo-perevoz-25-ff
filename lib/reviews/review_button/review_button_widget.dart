import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_button_model.dart';
export 'review_button_model.dart';

/// Кнопка открытия страницы отзывов
class ReviewButtonWidget extends StatefulWidget {
  const ReviewButtonWidget({
    super.key,
    required this.idApplication,
    required this.applicationNumber,
    required this.executer,
  });

  final int? idApplication;
  final String? applicationNumber;
  final int? executer;

  @override
  State<ReviewButtonWidget> createState() => _ReviewButtonWidgetState();
}

class _ReviewButtonWidgetState extends State<ReviewButtonWidget> {
  late ReviewButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ReviewsRow>>(
      future: ReviewsTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'application',
              widget.idApplication,
            )
            .eqOrNull(
              'sender',
              FFAppState().myID,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 10.0,
              height: 10.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<ReviewsRow> conditionalBuilderReviewsRowList = snapshot.data!;

        final conditionalBuilderReviewsRow =
            conditionalBuilderReviewsRowList.isNotEmpty
                ? conditionalBuilderReviewsRowList.first
                : null;

        return Builder(
          builder: (context) {
            if (conditionalBuilderReviewsRow?.id == null) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      Reviews1Widget.routeName,
                      queryParameters: {
                        'idApplication': serializeParam(
                          widget.idApplication,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Оставить отзыв',
                  options: FFButtonOptions(
                    width: 700.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent3,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      Reviews2Widget.routeName,
                      queryParameters: {
                        'idApplication': serializeParam(
                          widget.idApplication,
                          ParamType.int,
                        ),
                        'estimation': serializeParam(
                          conditionalBuilderReviewsRow?.estimation,
                          ParamType.int,
                        ),
                        'description': serializeParam(
                          conditionalBuilderReviewsRow?.description,
                          ParamType.String,
                        ),
                        'applicationNumber': serializeParam(
                          widget.applicationNumber,
                          ParamType.String,
                        ),
                        'idReviews': serializeParam(
                          conditionalBuilderReviewsRow?.id,
                          ParamType.int,
                        ),
                        'executer': serializeParam(
                          widget.executer,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Посмотреть отзыв',
                  options: FFButtonOptions(
                    width: 700.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).accent1,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
