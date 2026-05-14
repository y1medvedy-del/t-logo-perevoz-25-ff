import '/apllication/star_5_coneiner_text/star5_coneiner_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button70048_blue_widget.dart';
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
import 'aplication_reviews_model.dart';
export 'aplication_reviews_model.dart';

class AplicationReviewsWidget extends StatefulWidget {
  const AplicationReviewsWidget({
    super.key,
    required this.idCreatorAnsver,
    required this.idAnswer,
    required this.priceAnswer,
    required this.idApplication,
  });

  /// создатель ответа
  final int? idCreatorAnsver;

  final int? idAnswer;
  final int? priceAnswer;
  final int? idApplication;

  static String routeName = 'aplication_reviews';
  static String routePath = 'reviews_aplication';

  @override
  State<AplicationReviewsWidget> createState() =>
      _AplicationReviewsWidgetState();
}

class _AplicationReviewsWidgetState extends State<AplicationReviewsWidget> {
  late AplicationReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AplicationReviewsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        FutureBuilder<List<UserRow>>(
                          future: UserTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget.idCreatorAnsver,
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
                            List<UserRow> columnUserRowList = snapshot.data!;

                            final columnUserRow = columnUserRowList.isNotEmpty
                                ? columnUserRowList.first
                                : null;

                            return Column(
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
                                        queryFn: (q) => q.eqOrNull(
                                          'recipient',
                                          widget.idCreatorAnsver,
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
                                        List<ReviewsRow>
                                            containerReviewsRowList =
                                            snapshot.data!;

                                        return Container(
                                          width: 700.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    30.0,
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width >
                                                              MediaQuery.sizeOf(
                                                                      context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                2.0, 0.0),
                                                    child: Container(
                                                      width: 700.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          columnUserRow
                                                                              ?.rating
                                                                              ?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '/5',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                      starSaze:
                                                                          20,
                                                                      starYellow:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        functions
                                                                            .doubleToInt(columnUserRow?.rating),
                                                                        1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.quantituEstimation(
                                                                          containerReviewsRowList
                                                                              .length),
                                                                      'Нет оценок',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                      0,
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
                                                                    starSize:
                                                                        12,
                                                                    starYellow:
                                                                        5,
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
                                                                      0,
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
                                                                    starSize:
                                                                        12,
                                                                    starYellow:
                                                                        4,
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
                                                                      0,
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
                                                                    starSize:
                                                                        12,
                                                                    starYellow:
                                                                        3,
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
                                                                      0,
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
                                                                    starSize:
                                                                        12,
                                                                    starYellow:
                                                                        2,
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
                                                                      0,
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
                                                                    starSize:
                                                                        12,
                                                                    starYellow:
                                                                        1,
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
                                                      final reviewsList =
                                                          containerReviewsRowList
                                                              .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            reviewsList.length,
                                                        itemBuilder: (context,
                                                            reviewsListIndex) {
                                                          final reviewsListItem =
                                                              reviewsList[
                                                                  reviewsListIndex];
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
                                                              child: Container(
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
                                                                            .max,
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
                                                                                  reviewsListItem.estimation?.toString(),
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
                                                                              "dd MMMM, yyyy",
                                                                              reviewsListItem.createdAt,
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
                                                                              reviewsListItem.sender,
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
                                                                              '${textUserRow?.surname} ${columnUserRow?.name} ${textUserRow?.patronymic}',
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
                                                                        reviewsListItem
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
                                                                      Container(
                                                                        height:
                                                                            110.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child: FutureBuilder<
                                                                            List<ReviewsContentRow>>(
                                                                          future:
                                                                              ReviewsContentTable().queryRows(
                                                                            queryFn: (q) =>
                                                                                q.eqOrNull(
                                                                              'id_reviews',
                                                                              reviewsListItem.id,
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
                                                                            List<ReviewsContentRow>
                                                                                wrapReviewsContentRowList =
                                                                                snapshot.data!;

                                                                            return Wrap(
                                                                              spacing: 10.0,
                                                                              runSpacing: 10.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.vertical,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: List.generate(wrapReviewsContentRowList.length, (wrapIndex) {
                                                                                final wrapReviewsContentRow = wrapReviewsContentRowList[wrapIndex];
                                                                                return Builder(
                                                                                  builder: (context) {
                                                                                    if (wrapReviewsContentRow.photo ?? false) {
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
                                                                                                  wrapReviewsContentRow.referenceFile!,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                                allowRotation: false,
                                                                                                tag: wrapReviewsContentRow.referenceFile!,
                                                                                                useHeroAnimation: true,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                        child: Hero(
                                                                                          tag: wrapReviewsContentRow.referenceFile!,
                                                                                          transitionOnUserGestures: true,
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            child: Image.network(
                                                                                              wrapReviewsContentRow.referenceFile!,
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return Container(
                                                                                        width: 120.0,
                                                                                        height: 100.0,
                                                                                        child: Stack(
                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: FlutterFlowVideoPlayer(
                                                                                                path: wrapReviewsContentRow.referenceFile!,
                                                                                                videoType: VideoType.network,
                                                                                                autoPlay: false,
                                                                                                looping: false,
                                                                                                showControls: false,
                                                                                                allowFullScreen: true,
                                                                                                allowPlaybackSpeedMenu: false,
                                                                                                lazyLoad: false,
                                                                                                pauseOnNavigate: false,
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await launchURL(wrapReviewsContentRow.referenceFile!);
                                                                                              },
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ].addToEnd(
                                                    SizedBox(height: 200.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: wrapWithModel(
                            model: _model.button70048BlueModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: Button70048BlueWidget(
                              text: 'Выбрать исполнителем',
                              flagButton: false,
                              actionButton: () async {
                                await AplicationTable().update(
                                  data: {
                                    'price': widget.priceAnswer,
                                    'answer': widget.idAnswer,
                                    'answer_user_select':
                                        widget.idCreatorAnsver,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.idApplication,
                                  ),
                                );

                                context.pushNamed(General1Widget.routeName);
                              },
                            ),
                          ),
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
