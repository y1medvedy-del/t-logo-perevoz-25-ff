import '/apllication/star_5_coneiner_text/star5_coneiner_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/components/star55555_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profil_reviews_model.dart';
export 'profil_reviews_model.dart';

class ProfilReviewsWidget extends StatefulWidget {
  const ProfilReviewsWidget({
    super.key,
    double? rating,
  }) : this.rating = rating ?? 0.0;

  /// средняя оценка
  final double rating;

  static String routeName = 'profil_reviews';
  static String routePath = 'profil_reviews';

  @override
  State<ProfilReviewsWidget> createState() => _ProfilReviewsWidgetState();
}

class _ProfilReviewsWidgetState extends State<ProfilReviewsWidget> {
  late ProfilReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilReviewsModel());

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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0,
                0.0,
                0.0,
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width >
                          MediaQuery.sizeOf(context).height
                      ? 58.0
                      : 22.0,
                  0.0,
                )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.returneMenuModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ReturneMenuWidget(
                                text: 'Отзывы',
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: FutureBuilder<List<ReviewsRow>>(
                                  future: ReviewsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'recipient',
                                          FFAppState().myID,
                                        )
                                        .order('created_at'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 10.0,
                                          height: 10.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ReviewsRow> containerReviewsRowList =
                                        snapshot.data!;

                                    return Container(
                                      width: 700.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width >
                                                      MediaQuery.sizeOf(context)
                                                          .height
                                                  ? 58.0
                                                  : 30.0,
                                              0.0,
                                            ),
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width >
                                                      MediaQuery.sizeOf(context)
                                                          .height
                                                  ? 58.0
                                                  : 22.0,
                                              0.0,
                                            )),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 2.0, 0.0),
                                                child: Container(
                                                  width: 700.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .rating
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '/5',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .star55555Model,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    Star55555Widget(
                                                                  starSaze: 20,
                                                                  starYellow: functions
                                                                      .doubleToInt(
                                                                          widget
                                                                              .rating),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.quantituEstimation(
                                                                      valueOrDefault<
                                                                          int>(
                                                                    containerReviewsRowList
                                                                        .length,
                                                                    0,
                                                                  )),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width: 1.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .star5ConeinerTextModel1,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Star5ConeinerTextWidget(
                                                                assessment1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .length,
                                                                  1,
                                                                ),
                                                                assesment2:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .where((e) =>
                                                                          e.estimation ==
                                                                          5)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                ),
                                                                starSize: 12,
                                                                starYellow: 5,
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .star5ConeinerTextModel2,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Star5ConeinerTextWidget(
                                                                assessment1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .length,
                                                                  1,
                                                                ),
                                                                assesment2:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .where((e) =>
                                                                          e.estimation ==
                                                                          4)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                ),
                                                                starSize: 12,
                                                                starYellow: 4,
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .star5ConeinerTextModel3,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Star5ConeinerTextWidget(
                                                                assessment1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .length,
                                                                  1,
                                                                ),
                                                                assesment2:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .where((e) =>
                                                                          e.estimation ==
                                                                          3)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                ),
                                                                starSize: 12,
                                                                starYellow: 3,
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .star5ConeinerTextModel4,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Star5ConeinerTextWidget(
                                                                assessment1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .length,
                                                                  1,
                                                                ),
                                                                assesment2:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .where((e) =>
                                                                          e.estimation ==
                                                                          2)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                ),
                                                                starSize: 12,
                                                                starYellow: 2,
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .star5ConeinerTextModel5,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Star5ConeinerTextWidget(
                                                                assessment1:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .length,
                                                                  1,
                                                                ),
                                                                assesment2:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  containerReviewsRowList
                                                                      .where((e) =>
                                                                          e.estimation ==
                                                                          1)
                                                                      .toList()
                                                                      .length,
                                                                  0,
                                                                ),
                                                                starSize: 12,
                                                                starYellow: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final reviewseList =
                                                      containerReviewsRowList
                                                          .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        reviewseList.length,
                                                    itemBuilder: (context,
                                                        reviewseListIndex) {
                                                      final reviewseListItem =
                                                          reviewseList[
                                                              reviewseListIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              List<
                                                                  ReviewsContentRow>>(
                                                            future:
                                                                ReviewsContentTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'id_reviews',
                                                                reviewseListItem
                                                                    .id,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ReviewsContentRow>
                                                                  containerReviewsContentRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: 700.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                FFIcons.kstar,
                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  reviewseListItem.estimation?.toString(),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              "d MMMM yyyy",
                                                                              reviewseListItem.createdAt,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFFB5B5B5),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child: FutureBuilder<
                                                                            List<UserRow>>(
                                                                          future:
                                                                              UserTable().querySingleRow(
                                                                            queryFn: (q) =>
                                                                                q.eqOrNull(
                                                                              'id',
                                                                              reviewseListItem.sender,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<UserRow>
                                                                                textUserRowList =
                                                                                snapshot.data!;

                                                                            final textUserRow = textUserRowList.isNotEmpty
                                                                                ? textUserRowList.first
                                                                                : null;

                                                                            return Text(
                                                                              valueOrDefault<String>(
                                                                                textUserRow?.name,
                                                                                'name',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        reviewseListItem
                                                                            .description!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      if (containerReviewsContentRowList
                                                                          .isNotEmpty)
                                                                        Container(
                                                                          width:
                                                                              628.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final containerVar = containerReviewsContentRowList.toList();

                                                                              return ListView.separated(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: containerVar.length,
                                                                                separatorBuilder: (_, __) => SizedBox(width: 16.0),
                                                                                itemBuilder: (context, containerVarIndex) {
                                                                                  final containerVarItem = containerVar[containerVarIndex];
                                                                                  return Builder(
                                                                                    builder: (context) {
                                                                                      if (containerVarItem.photo ?? false) {
                                                                                        return InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await Navigator.push(
                                                                                              context,
                                                                                              PageTransition(
                                                                                                type: PageTransitionType.fade,
                                                                                                child: FlutterFlowExpandedImageView(
                                                                                                  image: Image.network(
                                                                                                    valueOrDefault<String>(
                                                                                                      containerVarItem.referenceFile,
                                                                                                      'https://images.unsplash.com/photo-1587654780291-39c9404d746b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxsZWdvfGVufDB8fHx8MTc0MDEwNzU3Mnww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                                                    ),
                                                                                                    fit: BoxFit.contain,
                                                                                                  ),
                                                                                                  allowRotation: false,
                                                                                                  tag: valueOrDefault<String>(
                                                                                                    containerVarItem.referenceFile,
                                                                                                    'https://images.unsplash.com/photo-1587654780291-39c9404d746b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxsZWdvfGVufDB8fHx8MTc0MDEwNzU3Mnww&ixlib=rb-4.0.3&q=80&w=1080' + '$containerVarIndex',
                                                                                                  ),
                                                                                                  useHeroAnimation: true,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: Hero(
                                                                                            tag: valueOrDefault<String>(
                                                                                              containerVarItem.referenceFile,
                                                                                              'https://images.unsplash.com/photo-1587654780291-39c9404d746b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxsZWdvfGVufDB8fHx8MTc0MDEwNzU3Mnww&ixlib=rb-4.0.3&q=80&w=1080' + '$containerVarIndex',
                                                                                            ),
                                                                                            transitionOnUserGestures: true,
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  containerVarItem.referenceFile,
                                                                                                  'https://images.unsplash.com/photo-1587654780291-39c9404d746b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxsZWdvfGVufDB8fHx8MTc0MDEwNzU3Mnww&ixlib=rb-4.0.3&q=80&w=1080',
                                                                                                ),
                                                                                                width: 100.0,
                                                                                                height: 100.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: FlutterFlowVideoPlayer(
                                                                                            path: containerVarItem.referenceFile!,
                                                                                            videoType: VideoType.network,
                                                                                            width: 100.0,
                                                                                            autoPlay: false,
                                                                                            looping: false,
                                                                                            showControls: false,
                                                                                            allowFullScreen: true,
                                                                                            allowPlaybackSpeedMenu: false,
                                                                                            lazyLoad: false,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (reviewseListItem.textAnswer == null ||
                                                                                reviewseListItem.textAnswer == '') {
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    ReviewsAnswerWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'idReviews': serializeParam(
                                                                                        reviewseListItem.id,
                                                                                        ParamType.int,
                                                                                      ),
                                                                                      'raiting': serializeParam(
                                                                                        widget.rating,
                                                                                        ParamType.double,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  'Написать ответ ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          "dd MMMM, yyyy",
                                                                                          reviewseListItem.timeAnswer!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFFB5B5B5),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Text(
                                                                                      'Ответ',
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      reviewseListItem.textAnswer,
                                                                                      ' answerReviews',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 12.0)),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].addToEnd(SizedBox(height: 200.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
