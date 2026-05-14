import '/backend/supabase/supabase.dart';
import '/components/list_application_plug_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/general/mobile_menu/mobile_menu_widget.dart';
import '/general/notifications/notifications_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat1_model.dart';
export 'chat1_model.dart';

class Chat1Widget extends StatefulWidget {
  const Chat1Widget({
    super.key,
    this.idChatBack,
  });

  /// id чата при возвращение назад для сброса значка уведомлений
  final int? idChatBack;

  static String routeName = 'chat1';
  static String routePath = 'chat1';

  @override
  State<Chat1Widget> createState() => _Chat1WidgetState();
}

class _Chat1WidgetState extends State<Chat1Widget> {
  late Chat1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat1Model());

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
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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

    return FutureBuilder<List<ChatWithUserAndApplicationInfoRow>>(
      future: ChatWithUserAndApplicationInfoTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user carrier',
              FFAppState().myID,
            )
            .order('last_message_day_and_time'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ChatWithUserAndApplicationInfoRow>
            chat1ChatWithUserAndApplicationInfoRowList = snapshot.data!;

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
              child: Container(
                decoration: BoxDecoration(),
                child: StreamBuilder<List<NotificationsRow>>(
                  stream: _model.containerSupabaseStream ??= SupaFlow.client
                      .from("notifications")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                        'user_id',
                        FFAppState().myID,
                      )
                      .map((list) =>
                          list.map((item) => NotificationsRow(item)).toList()),
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
                    List<NotificationsRow> containerNotificationsRowList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
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
                                buttonMenu: 3,
                              ),
                            ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .height
                                                        ? 58.0
                                                        : 24.0,
                                                    0.0,
                                                  ),
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .height
                                                        ? 76.0
                                                        : 24.0,
                                                    0.0,
                                                  ),
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            MediaQuery.sizeOf(
                                                                    context)
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
                                                'Чат',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                children: [
                                                  FutureBuilder<
                                                      List<SettingsRow>>(
                                                    future: SettingsTable()
                                                        .querySingleRow(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'flag',
                                                        true,
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
                                                      List<SettingsRow>
                                                          buttonSettingsRowList =
                                                          snapshot.data!;

                                                      final buttonSettingsRow =
                                                          buttonSettingsRowList
                                                                  .isNotEmpty
                                                              ? buttonSettingsRowList
                                                                  .first
                                                              : null;

                                                      return FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.cahatAdmin =
                                                              await ChatTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user carrier',
                                                                  FFAppState()
                                                                      .myID,
                                                                )
                                                                .eqOrNull(
                                                                  'chat_admin',
                                                                  true,
                                                                ),
                                                          );
                                                          if (_model.cahatAdmin !=
                                                                  null &&
                                                              (_model.cahatAdmin)!
                                                                  .isNotEmpty) {
                                                            context.pushNamed(
                                                              Chat3AdminWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'idChat':
                                                                    serializeParam(
                                                                  _model
                                                                      .cahatAdmin
                                                                      ?.firstOrNull
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            _model.insertChat =
                                                                await ChatTable()
                                                                    .insert({
                                                              'user carrier':
                                                                  FFAppState()
                                                                      .myID,
                                                              'chat_admin':
                                                                  true,
                                                              'recipient_admin':
                                                                  buttonSettingsRow
                                                                      ?.currentAdminUserId,
                                                            });

                                                            context.pushNamed(
                                                              Chat3AdminWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'idChat':
                                                                    serializeParam(
                                                                  _model
                                                                      .insertChat
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: 'Администратор ',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 185.0,
                                                          height: 44.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                                      10.0),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .notificationsModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: NotificationsWidget(
                                                      quantity:
                                                          valueOrDefault<int>(
                                                        containerNotificationsRowList
                                                            .where((e) =>
                                                                (e.viewed ==
                                                                    false) &&
                                                                (e.chat ==
                                                                    chat1ChatWithUserAndApplicationInfoRowList
                                                                        .where((e) =>
                                                                            e.chatAdmin ==
                                                                            true)
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.id))
                                                            .toList()
                                                            .length,
                                                        1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 30.0, 24.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 700.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 0),
                                                  () async {
                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  alignLabelWithHint: false,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(44.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
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
                                                          letterSpacing: 0.0,
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
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 0.0, 16.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .height
                                                        ? 122.0
                                                        : 30.0,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Container(
                                                  width: 700.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final containerVar = chat1ChatWithUserAndApplicationInfoRowList
                                                            .where((e) =>
                                                                (e.chatAdmin ==
                                                                    false) &&
                                                                functions.isLessThanTwoDays(
                                                                    e
                                                                        .applicationPaymentDate,
                                                                    FFAppState()
                                                                        .mySettings
                                                                        .daysToHideContacts
                                                                        .toString())!)
                                                            .toList();
                                                        if (containerVar
                                                            .isEmpty) {
                                                          return ListApplicationPlugWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            30.0,
                                                            0,
                                                            100.0,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              containerVar
                                                                  .length,
                                                          itemBuilder: (context,
                                                              containerVarIndex) {
                                                            final containerVarItem =
                                                                containerVar[
                                                                    containerVarIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  Chat2Widget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'idChat':
                                                                        serializeParam(
                                                                      containerVarItem
                                                                          .id,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'idResipient':
                                                                        serializeParam(
                                                                      containerVarItem
                                                                          .userWareHouse,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'namePage':
                                                                        serializeParam(
                                                                      'Чаты',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 700.0,
                                                                height: 70.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerVarItem.warehouseUserAvatar,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/oy1pzuc4edpe/favicon32.png',
                                                                                        ),
                                                                                        width: 28.0,
                                                                                        height: 28.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, -1.0),
                                                                                        child: Text(
                                                                                          'Заявка № ${valueOrDefault<String>(
                                                                                            containerVarItem.applicationNamber,
                                                                                            '7777',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Text(
                                                                                          containerVarItem.lastMessage != null && containerVarItem.lastMessage != ''
                                                                                              ? containerVarItem.lastMessage!
                                                                                              : ' '.maybeHandleOverflow(
                                                                                                  maxChars: 20,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  NotificationsWidget(
                                                                                    key: Key('Keyw2e_${containerVarIndex}_of_${containerVar.length}'),
                                                                                    quantity: valueOrDefault<int>(
                                                                                      containerNotificationsRowList.where((e) => (e.chat == containerVarItem.id) && (e.viewed == false)).toList().length,
                                                                                      1,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                  ),
                                                                                  if (containerVarItem.lastMessageDayAndTime != null)
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.dateMassageChat(containerVarItem.lastMessageDayAndTime),
                                                                                        'dd.MM.yy',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: valueOrDefault<int>(
                                                                                                      containerNotificationsRowList.where((e) => (e.chat == containerVarItem.id) && (e.viewed == false)).toList().length,
                                                                                                      1,
                                                                                                    ) >
                                                                                                    0
                                                                                                ? FlutterFlowTheme.of(context).warning
                                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          700.0,
                                                                      height:
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (!(isWeb
                                          ? MediaQuery.viewInsetsOf(context)
                                                  .bottom >
                                              0
                                          : _isKeyboardVisible) &&
                                      responsiveVisibility(
                                        context: context,
                                        desktop: false,
                                      ))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: wrapWithModel(
                                        model: _model.mobileMenuModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MobileMenuWidget(
                                          button: 3,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
