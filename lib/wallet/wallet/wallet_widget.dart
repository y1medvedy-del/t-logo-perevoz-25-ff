import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/general/mobile_menu/mobile_menu_widget.dart';
import '/wallet/payment_container/payment_container_widget.dart';
import '/wallet/walet_conteiner/walet_conteiner_widget.dart';
import '/wallet/wallet_replenish_summ_app/wallet_replenish_summ_app_widget.dart';
import '/wallet/wallet_replenish_summ_web/wallet_replenish_summ_web_widget.dart';
import '/window/custom_dialog/custom_dialog_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wallet_model.dart';
export 'wallet_model.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({
    super.key,
    this.date1Filter,
    this.date2Filter,
    this.tapePayment,
    this.tapeOperation,
    int? tabBar,
  }) : this.tabBar = tabBar ?? 0;

  final DateTime? date1Filter;
  final DateTime? date2Filter;
  final String? tapePayment;
  final String? tapeOperation;

  /// какая вкладка таб бара  открыта
  final int tabBar;

  static String routeName = 'wallet';
  static String routePath = 'wallet';

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget>
    with TickerProviderStateMixin {
  late WalletModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkFineVali = await actions.checkFineValidity();
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
    });

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

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabBar,
            0,
          ),
          2),
    )..addListener(() => safeSetState(() {}));

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
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
                      model: _model.menuPCModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuPCWidget(
                        buttonMenu: 2,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  MediaQuery.sizeOf(context)
                                                      .height
                                              ? 58.0
                                              : 24.0,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  MediaQuery.sizeOf(context)
                                                      .height
                                              ? 76.0
                                              : 24.0,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  MediaQuery.sizeOf(context)
                                                      .height
                                              ? 58.0
                                              : 24.0,
                                          0.0,
                                        ),
                                        24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Кошелек',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 0.0),
                                  child: FutureBuilder<List<WalletsRow>>(
                                    future: WalletsTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'company_id',
                                        FFAppState().myCompany,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<WalletsRow> containerWalletsRowList =
                                          snapshot.data!;

                                      final containerWalletsRow =
                                          containerWalletsRowList.isNotEmpty
                                              ? containerWalletsRowList.first
                                              : null;

                                      return Container(
                                        width: 700.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              formatNumber(
                                                containerWalletsRow!
                                                    .currentBalance,
                                                formatType: FormatType.custom,
                                                format: '0.0 ₽',
                                                locale: '',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Баланс кошелька',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .height) {
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
                                                                        1.0)
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
                                                                        Container(
                                                                      height:
                                                                          550.0,
                                                                      child:
                                                                          WalletReplenishSummAppWidget(
                                                                        replayceOutput:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
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
                                                                        1.0,
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
                                                                        Container(
                                                                      width:
                                                                          430.0,
                                                                      child:
                                                                          WalletReplenishSummWebWidget(
                                                                        replayceOutput:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      text: 'Пополнить',
                                                      options: FFButtonOptions(
                                                        width: 700.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                                                  color: Colors
                                                                      .white,
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 0.0),
                                  child: Container(
                                    width: 700.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Container(
                                                height: 48.0,
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () async {
                                                          safeSetState(() {});
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
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
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
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            .secondaryBackground,
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
                                                                  Icons.clear,
                                                                  size: 24.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          .asValidator(context),
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
                                                                .circular(8.0),
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
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                WalletFilterWidget.routeName,
                                                queryParameters: {
                                                  'date1': serializeParam(
                                                    widget.date1Filter,
                                                    ParamType.DateTime,
                                                  ),
                                                  'date2': serializeParam(
                                                    widget.date2Filter,
                                                    ParamType.DateTime,
                                                  ),
                                                  'tapePayment': serializeParam(
                                                    widget.tapePayment,
                                                    ParamType.String,
                                                  ),
                                                  'tapeOperation':
                                                      serializeParam(
                                                    widget.tapeOperation,
                                                    ParamType.String,
                                                  ),
                                                  'tabBar': serializeParam(
                                                    _model.tabBarCurrentIndex,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                wrapWithModel(
                                                  model: _model.button4848Model,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: Button4848Widget(
                                                    icon: Icon(
                                                      FFIcons.kproperty1Icons,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ),
                                                if ((widget.tapePayment !=
                                                            null &&
                                                        widget.tapePayment !=
                                                            '') ||
                                                    (widget.date1Filter !=
                                                        null) ||
                                                    (widget.tapeOperation !=
                                                            null &&
                                                        widget.tapeOperation !=
                                                            ''))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 0.0),
                                                    child: Container(
                                                      width: 8.0,
                                                      height: 8.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
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
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Container(
                                      width: 700.0,
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: 700.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                unselectedLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                tabs: [
                                                  Tab(
                                                    text: 'Действия',
                                                  ),
                                                  Tab(
                                                    text: 'История',
                                                  ),
                                                  Tab(
                                                    text: 'Счета',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 30.0,
                                                                2.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<WalletsRow>>(
                                                      future: WalletsTable()
                                                          .querySingleRow(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'company_id',
                                                          FFAppState()
                                                              .myCompany,
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
                                                        List<WalletsRow>
                                                            columnWalletsRowList =
                                                            snapshot.data!;

                                                        final columnWalletsRow =
                                                            columnWalletsRowList
                                                                    .isNotEmpty
                                                                ? columnWalletsRowList
                                                                    .first
                                                                : null;

                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          FineRow>>(
                                                                    future: (_model.requestCompleter ??= Completer<
                                                                            List<
                                                                                FineRow>>()
                                                                          ..complete(
                                                                              FineTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'valid',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'company_id',
                                                                                  FFAppState().myCompany,
                                                                                ),
                                                                          )))
                                                                        .future,
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<FineRow>
                                                                          fineFineRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            fineFineRowList.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 10.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                fineIndex) {
                                                                          final fineFineRow =
                                                                              fineFineRowList[fineIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(10.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        fineFineRow.description,
                                                                                        'description',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (functions.fine24hour(fineFineRow.createdAt, getCurrentTimestamp)!) {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  title: Text('Штраф анулирован'),
                                                                                                  content: Text('Прошло 24 часа с момента отмена согласованной заявки'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );

                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          _model.setting = await SettingsTable().queryRows(
                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                              'flag',
                                                                                              true,
                                                                                            ),
                                                                                          );

                                                                                          context.pushNamed(
                                                                                            WalletTypeFineWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'fine': serializeParam(
                                                                                                fineFineRow.id,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: 'Оплатить штраф',
                                                                                      options: FFButtonOptions(
                                                                                        width: 700.0,
                                                                                        height: 44.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 10.0)),
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
                                                              Flexible(
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ReplaceOutputInvoiceRow>>(
                                                                  future: ReplaceOutputInvoiceTable()
                                                                      .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'creator_id',
                                                                          FFAppState()
                                                                              .myID,
                                                                        )
                                                                        .eqOrNull(
                                                                          'status',
                                                                          'Ожидает',
                                                                        )
                                                                        .order('created_at'),
                                                                  ),
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ReplaceOutputInvoiceRow>
                                                                        containerReplaceOutputInvoiceRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final containerVar =
                                                                                containerReplaceOutputInvoiceRowList.where((e) => (_model.textController.text == '' ? true : functions.srt1ToStr2(_model.textController.text, '${e.amount?.toString()}${e.id?.toString()}${e.replace! ? 'Пополнение' : 'Вывод'}')!) && (widget.date1Filter == null ? true : functions.filterDate1Date2(widget.date1Filter, widget.date2Filter, e.createdAt!)!) && (widget.tapePayment == null || widget.tapePayment == '' ? true : (e.typePyament == widget.tapePayment))).toList();

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: containerVar.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                              itemBuilder: (context, containerVarIndex) {
                                                                                final containerVarItem = containerVar[containerVarIndex];
                                                                                return Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 382.0,
                                                                                      constraints: BoxConstraints(
                                                                                        minHeight: 60.0,
                                                                                      ),
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
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        '${valueOrDefault<String>(
                                                                                                          containerVarItem.replace! ? 'Пополнение ' : 'Вывод ',
                                                                                                          'text',
                                                                                                        )} №${containerVarItem.id?.toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerVarItem.typePyament,
                                                                                                          'type_payment',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          dateTimeFormat(
                                                                                                            "d  MMMM  H:mm",
                                                                                                            containerVarItem.createdAt,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                          ' date',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                children: [
                                                                                                  Builder(
                                                                                                    builder: (context) => FlutterFlowIconButton(
                                                                                                      borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      icon: Icon(
                                                                                                        FFIcons.kproperty124,
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (dialogContext) {
                                                                                                            return Dialog(
                                                                                                              elevation: 0,
                                                                                                              insetPadding: EdgeInsets.zero,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                              child: WebViewAware(
                                                                                                                child: GestureDetector(
                                                                                                                  onTap: () {
                                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                  },
                                                                                                                  child: Container(
                                                                                                                    height: 300.0,
                                                                                                                    width: 400.0,
                                                                                                                    child: CustomDialogWidget(
                                                                                                                      title: 'Отмена пополнения',
                                                                                                                      subtitle: 'Вы действительно хотите отменить пополнение кошелька?',
                                                                                                                      textBlueButton: 'Да',
                                                                                                                      textWhiteButton: 'Нет',
                                                                                                                      actionBlueButton: (selectBlue) async {
                                                                                                                        await ReplaceOutputTable().update(
                                                                                                                          data: {
                                                                                                                            'status': 'Отменено',
                                                                                                                          },
                                                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                                                            'id',
                                                                                                                            containerVarItem.id,
                                                                                                                          ),
                                                                                                                        );
                                                                                                                        Navigator.pop(context);
                                                                                                                      },
                                                                                                                      actionWhiteButton: (selectWhite) async {
                                                                                                                        Navigator.pop(context);
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        '${containerVarItem.amount! >= 0.0 ? '+' : ' '}${containerVarItem.amount?.toString()}',
                                                                                                        '5000',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: containerVarItem.amount! >= 0.0 ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).error,
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          if ((containerVarItem.paymentInvoiceLink == null || containerVarItem.paymentInvoiceLink == '') && (containerVarItem.replace == false))
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  final selectedFiles = await selectFiles(
                                                                                                    storageFolderPath: 'carrier',
                                                                                                    allowedExtensions: ['pdf'],
                                                                                                    multiFile: false,
                                                                                                  );
                                                                                                  if (selectedFiles != null) {
                                                                                                    safeSetState(() => _model.isDataUploading_uploadPayment = true);
                                                                                                    var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                    var downloadUrls = <String>[];
                                                                                                    try {
                                                                                                      selectedUploadedFiles = selectedFiles
                                                                                                          .map((m) => FFUploadedFile(
                                                                                                                name: m.storagePath.split('/').last,
                                                                                                                bytes: m.bytes,
                                                                                                                originalFilename: m.originalFilename,
                                                                                                              ))
                                                                                                          .toList();

                                                                                                      downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                        bucketName: 'replace_output',
                                                                                                        selectedFiles: selectedFiles,
                                                                                                      );
                                                                                                    } finally {
                                                                                                      _model.isDataUploading_uploadPayment = false;
                                                                                                    }
                                                                                                    if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                      safeSetState(() {
                                                                                                        _model.uploadedLocalFile_uploadPayment = selectedUploadedFiles.first;
                                                                                                        _model.uploadedFileUrl_uploadPayment = downloadUrls.first;
                                                                                                      });
                                                                                                    } else {
                                                                                                      safeSetState(() {});
                                                                                                      return;
                                                                                                    }
                                                                                                  }

                                                                                                  if (_model.uploadedFileUrl_uploadPayment != '') {
                                                                                                    await PaymentInvoiceTable().insert({
                                                                                                      'title': 'Счет на оплату Вывод № ${containerVarItem.id?.toString()}',
                                                                                                      'for_admin': true,
                                                                                                      'creator': FFAppState().myID,
                                                                                                      'replace_output': containerVarItem.id,
                                                                                                      'link': _model.uploadedFileUrl_uploadPayment,
                                                                                                      'amount': containerVarItem.amount,
                                                                                                    });
                                                                                                  }

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                text: 'Прикрепить счет',
                                                                                                icon: Icon(
                                                                                                  FFIcons.kproperty1filePlus,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: double.infinity,
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (containerVarItem.paymentInvoiceLink != null && containerVarItem.paymentInvoiceLink != '')
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  await launchURL(containerVarItem.paymentInvoiceLink!);
                                                                                                },
                                                                                                text: 'Счет',
                                                                                                icon: Icon(
                                                                                                  FFIcons.kproperty1,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: double.infinity,
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((containerVarItem.replace == true) && (containerVarItem.paymentInvoiceLink == null || containerVarItem.paymentInvoiceLink == ''))
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.access_time_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      containerVarItem.typePyament == 'По счету' ? 'Мы уже подготавливаем счет на оплату ' : 'Мы уже обрабатываем ваш запрос',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 10.0)),
                                                                                              ),
                                                                                            ),
                                                                                        ],
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
                                                                  },
                                                                ),
                                                              ),
                                                            ].addToEnd(SizedBox(
                                                                height: 100.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: FutureBuilder<
                                                            List<
                                                                TransactionsRow>>(
                                                          future:
                                                              TransactionsTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user_id',
                                                                  FFAppState()
                                                                      .myID,
                                                                )
                                                                .order(
                                                                    'created_at'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<TransactionsRow>
                                                                containerTransactionsRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final containerVar = containerTransactionsRowList
                                                                        .where((e) =>
                                                                            ((widget.tapePayment == null || widget.tapePayment == '') || (widget.tapePayment == e.transactionType)) &&
                                                                            ((widget.date1Filter == null) &&
                                                                                functions.filterDate1Date2(widget.date1Filter, widget.date2Filter, e.createdAt!)!) &&
                                                                            (widget.tapeOperation == null || widget.tapeOperation == '' ? true : functions.srt1ToStr2(widget.tapeOperation, e.description)!) &&
                                                                            (_model.textController.text == '' ? true : functions.srt1ToStr2(_model.textController.text, e.description)!))
                                                                        .toList();

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        100.0,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          containerVar
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 8.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              containerVarIndex) {
                                                                        final containerVarItem =
                                                                            containerVar[containerVarIndex];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            WaletConteinerWidget(
                                                                              key: Key('Keyxri_${containerVarIndex}_of_${containerVar.length}'),
                                                                              transactions: containerVarItem,
                                                                            ),
                                                                            Divider(
                                                                              thickness: 1.0,
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: FutureBuilder<
                                                            List<
                                                                PaymentInvoiceWithActLinkRow>>(
                                                          future:
                                                              PaymentInvoiceWithActLinkTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .or(
                                                                    "recipient.eq.${FFAppState().myID}, creator.eq.${FFAppState().myID}")
                                                                .order(
                                                                    'created_at'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<PaymentInvoiceWithActLinkRow>
                                                                containerPaymentInvoiceWithActLinkRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final containerVar = containerPaymentInvoiceWithActLinkRowList
                                                                        .where((e) =>
                                                                            ((_model.textController.text == '' ? true : functions.srt1ToStr2(_model.textController.text, '${e.title}${e.amount?.toString()}${e.titleStatus}')) ==
                                                                                true) &&
                                                                            (widget.date1Filter == null
                                                                                ? true
                                                                                : functions.filterDate1Date2(widget.date1Filter, widget.date2Filter, e.createdAt!)!) &&
                                                                            (widget.tapeOperation == null || widget.tapeOperation == '' ? true : functions.srt1ToStr2(widget.tapeOperation, e.title)!))
                                                                        .toList();

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        100.0,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          containerVar
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 8.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              containerVarIndex) {
                                                                        final containerVarItem =
                                                                            containerVar[containerVarIndex];
                                                                        return PaymentContainerWidget(
                                                                          key: Key(
                                                                              'Key157_${containerVarIndex}_of_${containerVar.length}'),
                                                                          paymentInvoseVAct:
                                                                              containerVarItem,
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          width: 382.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (!(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible) &&
                                responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: wrapWithModel(
                                  model: _model.mobileMenuModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MobileMenuWidget(
                                    button: 2,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
