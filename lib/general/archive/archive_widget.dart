import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/archive_application/archive_application_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'archive_model.dart';
export 'archive_model.dart';

class ArchiveWidget extends StatefulWidget {
  const ArchiveWidget({
    super.key,
    this.cityFilter,
    this.date1Filter,
    this.date2Filter,
  });

  final int? cityFilter;
  final DateTime? date1Filter;
  final DateTime? date2Filter;

  static String routeName = 'archive';
  static String routePath = 'archive';

  @override
  State<ArchiveWidget> createState() => _ArchiveWidgetState();
}

class _ArchiveWidgetState extends State<ArchiveWidget> {
  late ArchiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArchiveModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.returneMenuModel,
                updateCallback: () => safeSetState(() {}),
                child: ReturneMenuWidget(
                  text: 'Архив заявок',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  alignLabelWithHint: false,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          44.0, 0.0, 0.0, 0.0),
                                  suffixIcon:
                                      _model.textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                safeSetState(() {});
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 24.0,
                                              ),
                                            )
                                          : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/85ajbvhkfi8y/Icn_(2).png',
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          General2FilterWidget.routeName,
                          queryParameters: {
                            'city': serializeParam(
                              widget.cityFilter,
                              ParamType.int,
                            ),
                            'date1': serializeParam(
                              widget.date1Filter,
                              ParamType.DateTime,
                            ),
                            'date2': serializeParam(
                              widget.date2Filter,
                              ParamType.DateTime,
                            ),
                            'page': serializeParam(
                              'архив',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Stack(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        children: [
                          wrapWithModel(
                            model: _model.button4848Model,
                            updateCallback: () => safeSetState(() {}),
                            child: Button4848Widget(
                              icon: Icon(
                                FFIcons.kproperty1Icons,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              colorButton: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          if ((widget.cityFilter != null) ||
                              (widget.date1Filter != null))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 0.0),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).warning,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StreamBuilder<List<AplicationRow>>(
                          stream: _model.actionSupabaseStream ??= SupaFlow
                              .client
                              .from("aplication")
                              .stream(primaryKey: ['id'])
                              .eqOrNull(
                                'creator',
                                FFAppState().myID,
                              )
                              .order('created_at')
                              .map((list) => list
                                  .map((item) => AplicationRow(item))
                                  .toList()),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<AplicationRow> actionAplicationRowList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final applicationList = actionAplicationRowList
                                      .where((e) =>
                                          ((_model.textController.text ==
                                                      '') ||
                                              functions.srt1ToStr2(
                                                  _model.textController.text,
                                                  '${e.adresStreetCreator}${e.namber}${e.paymentStatus}${e.city}')!) &&
                                          ((widget.cityFilter == e.cityId) ||
                                              (widget.cityFilter == null)) &&
                                          ((widget.date1Filter == null) ||
                                              functions.filterDate1Date2(
                                                  widget.date1Filter,
                                                  widget.date2Filter,
                                                  e.createdAt)!) &&
                                          (e.archive == true))
                                      .toList();

                                  return GridView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      10.0,
                                      0,
                                      200.0,
                                    ),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: valueOrDefault<int>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 1;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 2;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 2;
                                          } else {
                                            return 2;
                                          }
                                        }(),
                                        2,
                                      ),
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 3.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 3.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 3.0;
                                          } else {
                                            return 4.0;
                                          }
                                        }(),
                                        3.0,
                                      ),
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: applicationList.length,
                                    itemBuilder:
                                        (context, applicationListIndex) {
                                      final applicationListItem =
                                          applicationList[applicationListIndex];
                                      return ArchiveApplicationWidget(
                                        key: Key(
                                            'Key2jr_${applicationListIndex}_of_${applicationList.length}'),
                                        aplicationDoc: applicationListItem,
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ].addToEnd(SizedBox(height: 100.0)),
                    ),
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
