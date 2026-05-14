import '/ananimus/menu_p_c_ananimus/menu_p_c_ananimus_widget.dart';
import '/ananimus/mobile_menu_ananimus/mobile_menu_ananimus_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/components/list_application_plug_widget.dart';
import '/creating_apllcationi/draft_info/draft_info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/general/general_application/general_application_widget.dart';
import '/general/notifications/notifications_widget.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'general1_ananimus_model.dart';
export 'general1_ananimus_model.dart';

class General1AnanimusWidget extends StatefulWidget {
  const General1AnanimusWidget({
    super.key,
    this.cityFilter,
    this.date1Filter,
    this.date2Filter,
    this.companyID,
  });

  final int? cityFilter;
  final DateTime? date1Filter;
  final DateTime? date2Filter;
  final int? companyID;

  static String routeName = 'general_1_Ananimus';
  static String routePath = 'general1Ananimus';

  @override
  State<General1AnanimusWidget> createState() => _General1AnanimusWidgetState();
}

class _General1AnanimusWidgetState extends State<General1AnanimusWidget> {
  late General1AnanimusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => General1AnanimusModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                wrapWithModel(
                  model: _model.menuPCAnanimusModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MenuPCAnanimusWidget(
                    buttonMenu: 1,
                  ),
                ),
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Container(
                                            width: 100.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Container(
                                            width: 100.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      CustomDialogWidget(
                                                                    title:
                                                                        'Доступ ограничен',
                                                                    subtitle:
                                                                        'Для использования всех функций приложения необходимо зарегистрироваться или войти в существующий аккаунт.  Без регистрации доступны только базовые возможности. После регистрации вы получите полный доступ ко всем разделам приложения.',
                                                                    textBlueButton:
                                                                        'Регистрация',
                                                                    textWhiteButton:
                                                                        'Продолжить',
                                                                    actionBlueButton:
                                                                        (selectBlue) async {
                                                                      context.goNamed(
                                                                          Onbording2Widget
                                                                              .routeName);
                                                                    },
                                                                    actionWhiteButton:
                                                                        (selectWhite) async {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 382.0,
                                                        height: 44.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/___.png',
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  AutoSizeText(
                                                                'Здравствуйте, гость',
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    16.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_right_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 100.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kproperty1menu,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        CustomDialogWidget(
                                                                      title:
                                                                          'Доступ ограничен',
                                                                      subtitle:
                                                                          'Для использования всех функций приложения необходимо зарегистрироваться или войти в существующий аккаунт.  Без регистрации доступны только базовые возможности. После регистрации вы получите полный доступ ко всем разделам приложения.',
                                                                      textBlueButton:
                                                                          'Регистрация',
                                                                      textWhiteButton:
                                                                          'Продолжить',
                                                                      actionBlueButton:
                                                                          (selectBlue) async {
                                                                        context.goNamed(
                                                                            Onbording2Widget.routeName);
                                                                      },
                                                                      actionWhiteButton:
                                                                          (selectWhite) async {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            Notification1Widget
                                                                .routeName);
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              icon: Icon(
                                                                FFIcons
                                                                    .kproperty1bell,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    Notification1Widget
                                                                        .routeName);
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    NotificationAdminRow>>(
                                                              stream: _model.containerSupabaseStream ??= SupaFlow
                                                                  .client
                                                                  .from(
                                                                      "notification_admin")
                                                                  .stream(
                                                                      primaryKey: [
                                                                        'id'
                                                                      ])
                                                                  .eqOrNull(
                                                                    'carrier',
                                                                    true,
                                                                  )
                                                                  .map((list) => list
                                                                      .map((item) =>
                                                                          NotificationAdminRow(
                                                                              item))
                                                                      .toList()),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<NotificationAdminRow>
                                                                    containerNotificationAdminRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .notificationsModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        NotificationsWidget(
                                                                      quantity: containerNotificationAdminRowList
                                                                          .where((e) =>
                                                                              e.usersSaw.contains(FFAppState().myID) ==
                                                                              false)
                                                                          .toList()
                                                                          .length,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (FFAppState()
                                                .mySettings
                                                .hideBanner ==
                                            false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child:
                                                FutureBuilder<List<BannerRow>>(
                                              future: BannerTable().queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'ware hause',
                                                      true,
                                                    )
                                                    .eqOrNull(
                                                      'archive',
                                                      false,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<BannerRow>
                                                    carouselBannerRowList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  height: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return (MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.2);
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return (MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.4);
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return (MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.3);
                                                    } else {
                                                      return (MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.3);
                                                    }
                                                  }(),
                                                  child: CarouselSlider.builder(
                                                    itemCount:
                                                        carouselBannerRowList
                                                            .length,
                                                    itemBuilder: (context,
                                                        carouselIndex, _) {
                                                      final carouselBannerRow =
                                                          carouselBannerRowList[
                                                              carouselIndex];
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            carouselBannerRow
                                                                .linkImage,
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Aspect_ratio_-_16x9.svg/2560px-Aspect_ratio_-_16x9.svg.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      );
                                                    },
                                                    carouselController: _model
                                                            .carouselController ??=
                                                        CarouselSliderController(),
                                                    options: CarouselOptions(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              1,
                                                              carouselBannerRowList
                                                                      .length -
                                                                  1)),
                                                      viewportFraction: 0.8,
                                                      disableCenter: false,
                                                      enlargeCenterPage: true,
                                                      enlargeFactor: 0.1,
                                                      enableInfiniteScroll:
                                                          true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      autoPlay: true,
                                                      autoPlayAnimationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  800),
                                                      autoPlayInterval:
                                                          Duration(
                                                              milliseconds:
                                                                  (800 + 4000)),
                                                      autoPlayCurve:
                                                          Curves.linear,
                                                      pauseAutoPlayInFiniteScroll:
                                                          true,
                                                      onPageChanged: (index,
                                                              _) =>
                                                          _model.carouselCurrentIndex =
                                                              index,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                      ].addToEnd(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0,
                                        valueOrDefault<double>(
                                          isWeb ? 30.0 : 24.0,
                                          0.0,
                                        ),
                                        24.0,
                                        0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    height: 48.0,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController',
                                                            Duration(
                                                                milliseconds:
                                                                    0),
                                                            () async {
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            alignLabelWithHint:
                                                                false,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        44.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            suffixIcon: _model
                                                                    .textController!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .textController
                                                                          ?.clear();
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
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
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    General2FilterWidget
                                                        .routeName,
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
                                                        'главная',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .button4848Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: Button4848Widget(
                                                        icon: Icon(
                                                          FFIcons
                                                              .kproperty1Icons,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                      ),
                                                    ),
                                                    if ((widget.cityFilter !=
                                                            null) ||
                                                        (widget.date1Filter !=
                                                            null))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    6.0,
                                                                    6.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 8.0,
                                                          height: 8.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0,
                                                  valueOrDefault<double>(
                                                    isWeb ? 22.0 : 16.0,
                                                    16.0,
                                                  ),
                                                  2.0,
                                                  0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Stack(
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await NotificationsTable()
                                                            .update(
                                                          data: {
                                                            'viewed': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    FFAppState()
                                                                        .myID,
                                                                  )
                                                                  .eqOrNull(
                                                                    'category',
                                                                    'Заявка',
                                                                  )
                                                                  .eqOrNull(
                                                                    'viewed',
                                                                    false,
                                                                  )
                                                                  .eqOrNull(
                                                                    'body',
                                                                    'В работе',
                                                                  ),
                                                        );
                                                        if ((_model.updateNotification !=
                                                                    null &&
                                                                (_model.updateNotification)!
                                                                    .isNotEmpty) ==
                                                            true) {
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                        _model.tab = 'Активные';
                                                        _model.jobStatus = _model
                                                            .actionApplication
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Активные',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: _model.tab ==
                                                                'Активные'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .tab ==
                                                                          'Активные'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: _model.tab ==
                                                                  'Активные'
                                                              ? Colors
                                                                  .transparent
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  30.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Stack(
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await NotificationsTable()
                                                            .update(
                                                          data: {
                                                            'viewed': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    FFAppState()
                                                                        .myID,
                                                                  )
                                                                  .eqOrNull(
                                                                    'category',
                                                                    'Заявка',
                                                                  )
                                                                  .eqOrNull(
                                                                    'viewed',
                                                                    false,
                                                                  )
                                                                  .eqOrNull(
                                                                    'body',
                                                                    'Черновик',
                                                                  ),
                                                        );
                                                        if (_model.updateNotification3 !=
                                                                null &&
                                                            (_model.updateNotification3)!
                                                                .isNotEmpty) {
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                        _model.tab =
                                                            'Черновики';
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Черновики',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: _model
                                                                    .tab ==
                                                                'Черновики'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .tab ==
                                                                          'Черновики'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: _model.tab ==
                                                                  'Черновики'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await NotificationsTable()
                                                            .update(
                                                          data: {
                                                            'viewed': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    FFAppState()
                                                                        .myID,
                                                                  )
                                                                  .eqOrNull(
                                                                    'category',
                                                                    'Заявка',
                                                                  )
                                                                  .eqOrNull(
                                                                    'viewed',
                                                                    false,
                                                                  )
                                                                  .eqOrNull(
                                                                    'body',
                                                                    'Завершена',
                                                                  ),
                                                        );
                                                        await NotificationsTable()
                                                            .update(
                                                          data: {
                                                            'viewed': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    FFAppState()
                                                                        .myID,
                                                                  )
                                                                  .eqOrNull(
                                                                    'category',
                                                                    'Заявка',
                                                                  )
                                                                  .eqOrNull(
                                                                    'viewed',
                                                                    false,
                                                                  )
                                                                  .eqOrNull(
                                                                    'body',
                                                                    'Отменена',
                                                                  ),
                                                        );
                                                        if (_model.updateNotification3 !=
                                                                null &&
                                                            (_model.updateNotification3)!
                                                                .isNotEmpty) {
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                        _model.tab =
                                                            'Завершенные';
                                                        _model.jobStatus =
                                                            _model.completed
                                                                .toList()
                                                                .cast<String>();
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Завершенные',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: _model.tab ==
                                                                'Завершенные'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: _model
                                                                              .tab ==
                                                                          'Завершенные'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: _model.tab ==
                                                                  'Завершенные'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  30.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.tab == 'Завершенные')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      ArchiveWidget.routeName);
                                                },
                                                text: 'Архив',
                                                options: FFButtonOptions(
                                                  width: 120.0,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFF3D883),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (_model.tab !=
                                                      'Черновики') {
                                                    return StreamBuilder<
                                                        List<AplicationRow>>(
                                                      stream: _model
                                                              .actionSupabaseStream ??=
                                                          SupaFlow
                                                              .client
                                                              .from(
                                                                  "aplication")
                                                              .stream(
                                                                  primaryKey: [
                                                                    'id'
                                                                  ])
                                                              .order(
                                                                  'created_at')
                                                              .map((list) => list
                                                                  .map((item) =>
                                                                      AplicationRow(
                                                                          item))
                                                                  .toList()),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                ListApplicationPlugWidget(),
                                                          );
                                                        }
                                                        List<AplicationRow>
                                                            actionAplicationRowList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final applicationList = actionAplicationRowList
                                                                  .where((e) =>
                                                                      ((_model.textController.text == '') ||
                                                                          functions.srt1ToStr2(
                                                                              _model
                                                                                  .textController
                                                                                  .text,
                                                                              '${e.adresStreetCreator}${e.namber}${e.paymentStatus}${e.city}')!) &&
                                                                      ((widget.cityFilter == e.cityId) ||
                                                                          (widget.cityFilter ==
                                                                              null)) &&
                                                                      ((widget.date1Filter ==
                                                                              null) ||
                                                                          functions.filterDate1Date2(
                                                                              widget
                                                                                  .date1Filter,
                                                                              widget
                                                                                  .date2Filter,
                                                                              e
                                                                                  .createdAt)!) &&
                                                                      (_model.jobStatus.contains(e.jobStatus) ==
                                                                          true) &&
                                                                      (e.archive ==
                                                                          false))
                                                                  .toList();
                                                              if (applicationList
                                                                  .isEmpty) {
                                                                return ListApplicationPlugWidget();
                                                              }

                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  10.0,
                                                                  0,
                                                                  200.0,
                                                                ),
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      valueOrDefault<
                                                                          int>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
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
                                                                  crossAxisSpacing:
                                                                      10.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
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
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    applicationList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        applicationListIndex) {
                                                                  final applicationListItem =
                                                                      applicationList[
                                                                          applicationListIndex];
                                                                  return GeneralApplicationWidget(
                                                                    key: Key(
                                                                        'Keya86_${applicationListIndex}_of_${applicationList.length}'),
                                                                    idApplication:
                                                                        applicationListItem
                                                                            .id,
                                                                    idAnswer:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      applicationListItem
                                                                          .answer,
                                                                      0,
                                                                    ),
                                                                    aplicationDoc:
                                                                        applicationListItem,
                                                                    numberApplication:
                                                                        applicationListItem
                                                                            .namber!,
                                                                    jobStatus:
                                                                        applicationListItem
                                                                            .jobStatus!,
                                                                    stage:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      () {
                                                                        if ((applicationListItem.jobStatus ==
                                                                                'Создана') &&
                                                                            !(applicationListItem
                                                                                .listIdUserAnswer.isNotEmpty)) {
                                                                          return 0;
                                                                        } else if ((applicationListItem.jobStatus ==
                                                                                'Создана') &&
                                                                            (applicationListItem
                                                                                .listIdUserAnswer.isNotEmpty) &&
                                                                            (applicationListItem.answerUserSelect ==
                                                                                null)) {
                                                                          return 1;
                                                                        } else if ((applicationListItem.jobStatus ==
                                                                                'Создана') &&
                                                                            (applicationListItem
                                                                                .listIdUserAnswer.isNotEmpty) &&
                                                                            (applicationListItem.answerUserSelect !=
                                                                                null)) {
                                                                          return 2;
                                                                        } else if ((applicationListItem.jobStatus ==
                                                                                'В работе') &&
                                                                            (applicationListItem.descriptionStatus ==
                                                                                'Согласована')) {
                                                                          return 3;
                                                                        } else if ((applicationListItem.jobStatus ==
                                                                                'В работе') &&
                                                                            (applicationListItem.descriptionStatus ==
                                                                                'Перепаллечивают')) {
                                                                          return 4;
                                                                        } else {
                                                                          return 5;
                                                                        }
                                                                      }(),
                                                                      0,
                                                                    ),
                                                                    descriptionStatus:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      applicationListItem
                                                                          .descriptionStatus,
                                                                      'description',
                                                                    ),
                                                                    paymentStatus:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      applicationListItem
                                                                          .paymentStatus,
                                                                      'payment status',
                                                                    ),
                                                                    city: valueOrDefault<
                                                                        String>(
                                                                      applicationListItem
                                                                          .city,
                                                                      'city',
                                                                    ),
                                                                    street: valueOrDefault<
                                                                        String>(
                                                                      applicationListItem
                                                                          .adresStreetCreator,
                                                                      'street',
                                                                    ),
                                                                    createAt:
                                                                        applicationListItem
                                                                            .createdAt,
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Visibility(
                                                        visible: (FFAppState()
                                                                .localApplicationList
                                                                .isNotEmpty) ==
                                                            true,
                                                        child: Builder(
                                                          builder: (context) {
                                                            final draftList =
                                                                FFAppState()
                                                                    .localApplicationList
                                                                    .toList();
                                                            if (draftList
                                                                .isEmpty) {
                                                              return ListApplicationPlugWidget();
                                                            }

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                10.0,
                                                                0,
                                                                200.0,
                                                              ),
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
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
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    10.0,
                                                                childAspectRatio:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
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
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  draftList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  draftListIndex) {
                                                                final draftListItem =
                                                                    draftList[
                                                                        draftListIndex];
                                                                return Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: DraftInfoWidget(
                                                                                  itemDraft: draftListIndex,
                                                                                  draft: draftListItem,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          550.0,
                                                                      height:
                                                                          120.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(14.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Flexible(
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              'Заполненно ${draftListItem.creatinStage.toString()}/7',
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Черновик',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.montserrat(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 30.0)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      dateTimeFormat(
                                                                                        "d MMMM H:mm",
                                                                                        draftListItem.createDate,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      'Дата',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            'г. ${draftListItem.cityName}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            draftListItem.addressStreet,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 2.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (_model.tablet)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 24.0),
                              child: Container(
                                width: 700.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 14.0, 16.0, 14.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'В данный момент 150 складов готовы откликнуться на вашу заявку',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.tablet = false;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        text: 'Закрыть',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        CreatinApllication1Widget.routeName);
                                  },
                                  text: 'Создать заявку',
                                  icon: Icon(
                                    Icons.add,
                                    size: 24.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 700.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            child: Visibility(
                              visible: !(isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible) &&
                                  responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: wrapWithModel(
                                  model: _model.mobileMenuAnanimusModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MobileMenuAnanimusWidget(
                                    button: 1,
                                  ),
                                ),
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
    );
  }
}
