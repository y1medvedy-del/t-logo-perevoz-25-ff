import '/apllication/row_icon_text/row_icon_text_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/window/information_window/information_window_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'aswer_work_model.dart';
export 'aswer_work_model.dart';

class AswerWorkWidget extends StatefulWidget {
  const AswerWorkWidget({
    super.key,
    required this.idApplication,
    required this.idAnswer,
    bool? flag,
    required this.creationAtApplication,
  }) : this.flag = flag ?? false;

  final int? idApplication;
  final int? idAnswer;
  final bool flag;

  /// дата создания заявки
  final DateTime? creationAtApplication;

  @override
  State<AswerWorkWidget> createState() => _AswerWorkWidgetState();
}

class _AswerWorkWidgetState extends State<AswerWorkWidget> {
  late AswerWorkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AswerWorkModel());

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

    return FutureBuilder<List<AnswerRow>>(
      future: AnswerTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.idAnswer,
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
        List<AnswerRow> containerAnswerRowList = snapshot.data!;

        final containerAnswerRow = containerAnswerRowList.isNotEmpty
            ? containerAnswerRowList.first
            : null;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: FutureBuilder<List<AplicationRow>>(
            future: AplicationTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.idApplication,
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
              List<AplicationRow> columnAplicationRowList = snapshot.data!;

              final columnAplicationRow = columnAplicationRowList.isNotEmpty
                  ? columnAplicationRowList.first
                  : null;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (containerAnswerRow?.answerEdit ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 16.0),
                      child: Container(
                        width: 700.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Container(
                    width: 700.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: 700.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F7FA),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(0xFFD0D5D8),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 16.0, 12.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.rowIconTextModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: RowIconTextWidget(
                                      icon: Icon(
                                        FFIcons.kproperty1calendar,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      text1: 'Дата',
                                      text2:
                                          '${containerAnswerRow?.suggestedDate}, ${containerAnswerRow?.suggestedTime}',
                                      iconInfo: false,
                                      newPrace: false,
                                      action: () async {},
                                    ),
                                  ),
                                  if ((columnAplicationRow?.jobStatus !=
                                          'Создана') &&
                                      functions.isLessThanTwoDays(
                                          columnAplicationRow?.paymentDate !=
                                                  null
                                              ? columnAplicationRow?.paymentDate
                                              : columnAplicationRow?.createdAt,
                                          FFAppState()
                                              .mySettings
                                              .daysToHideContacts
                                              .toString())!)
                                    wrapWithModel(
                                      model: _model.rowIconTextModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: RowIconTextWidget(
                                        icon: Icon(
                                          FFIcons.kproperty1Geo24,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        text1: 'Адрес склада',
                                        text2: columnAplicationRow?.jobStatus ==
                                                'Создана'
                                            ? '${containerAnswerRow?.city}, ${containerAnswerRow?.street}'
                                            : '${containerAnswerRow?.city}, ${containerAnswerRow?.street}, ${containerAnswerRow?.house}',
                                        iconInfo: false,
                                        newPrace: false,
                                        action: () async {},
                                      ),
                                    ),
                                  if ((columnAplicationRow?.jobStatus !=
                                          'Создана') &&
                                      functions.isLessThanTwoDays(
                                          widget.creationAtApplication,
                                          FFAppState()
                                              .mySettings
                                              .daysToHideContacts
                                              .toString())!)
                                    FutureBuilder<List<UserRow>>(
                                      future: UserTable().querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          containerAnswerRow?.createUser,
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
                                        List<UserRow> rowIconTextUserRowList =
                                            snapshot.data!;

                                        final rowIconTextUserRow =
                                            rowIconTextUserRowList.isNotEmpty
                                                ? rowIconTextUserRowList.first
                                                : null;

                                        return wrapWithModel(
                                          model: _model.rowIconTextModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: RowIconTextWidget(
                                            icon: Icon(
                                              FFIcons.kproperty1phone1,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            text1: 'Телефон',
                                            text2: valueOrDefault<String>(
                                              rowIconTextUserRow?.phoneUser,
                                              ' телефон',
                                            ),
                                            text3: '',
                                            text4: '',
                                            iconInfo: false,
                                            newPrace: false,
                                            action: () async {},
                                          ),
                                        );
                                      },
                                    ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.tab == 2) {
                                        return wrapWithModel(
                                          model: _model.rowIconTextModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: RowIconTextWidget(
                                            icon: Icon(
                                              FFIcons
                                                  .kproperty1rubleSvgrepoCom11,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            text1:
                                                'Сумма, предложенная складом',
                                            text2: '${valueOrDefault<String>(
                                              ((containerAnswerRow?.newPrice !=
                                                              null
                                                          ? containerAnswerRow!
                                                              .newPrice!
                                                          : containerAnswerRow!
                                                              .price!) +
                                                      ((containerAnswerRow
                                                                      .newPrice !=
                                                                  null
                                                              ? containerAnswerRow
                                                                  .newPrice!
                                                              : containerAnswerRow
                                                                  .price!) *
                                                          (columnAplicationRow!
                                                              .markup!) /
                                                          100))
                                                  .toString(),
                                              '0',
                                            )} ₽',
                                            iconInfo: false,
                                            newPrace: true,
                                            action: () async {},
                                          ),
                                        );
                                      } else {
                                        return wrapWithModel(
                                          model: _model.rowIconTextModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: RowIconTextWidget(
                                            icon: Icon(
                                              FFIcons
                                                  .kproperty1rubleSvgrepoCom11,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            text1:
                                                'Сумма, предложенная складом',
                                            text2: '${valueOrDefault<String>(
                                              ((containerAnswerRow!.price!) +
                                                      ((containerAnswerRow
                                                              .price!) *
                                                          (columnAplicationRow!
                                                              .markup!) /
                                                          100))
                                                  .toString(),
                                              '0',
                                            )} ₽',
                                            iconInfo: false,
                                            newPrace: false,
                                            action: () async {},
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  if (containerAnswerRow?.newPrice != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              InformationWindowWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  FFIcons.kproperty1alertCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                'Фактическая стоимость изменилась',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (containerAnswerRow?.newPrice != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.tab = 1;
                                                safeSetState(() {});
                                              },
                                              text: 'Заявлено',
                                              options: FFButtonOptions(
                                                width: 191.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: _model.tab == 1
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .accent3
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.tab = 2;
                                                safeSetState(() {});
                                              },
                                              text: 'Выполненно',
                                              options: FFButtonOptions(
                                                width: 191.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  _model.tab == 2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent3
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                                ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (widget.flag)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              FFIcons.kproperty1package,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      Flexible(
                                        child:
                                            FutureBuilder<List<WorkAnswerRow>>(
                                          future: WorkAnswerTable().queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'answer_id',
                                                  widget.idAnswer,
                                                )
                                                .order('id', ascending: true),
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
                                            List<WorkAnswerRow>
                                                containerWorkAnswerRowList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Работы',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF667078),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.tab == 2) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final containerVar =
                                                                containerWorkAnswerRowList
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    .where((e) =>
                                                                        !e.deletedEditing!)
                                                                    .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                2.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  containerVar
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                              itemBuilder: (context,
                                                                  containerVarIndex) {
                                                                final containerVarItem =
                                                                    containerVar[
                                                                        containerVarIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: (containerVarItem.newQuantity !=
                                                                                null) ||
                                                                            (containerVarItem.newPrice !=
                                                                                null)
                                                                        ? Color(
                                                                            0xFFF3D883)
                                                                        : Color(
                                                                            0x00000000),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            5.0,
                                                                            15.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            containerVarItem.nameWork,
                                                                            ' Название работ',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Text(
                                                                                '${(valueOrDefault<int>(
                                                                                      containerVarItem.newPrice != null ? containerVarItem.newPrice : containerVarItem.price,
                                                                                      0,
                                                                                    ) + (valueOrDefault<int>(
                                                                                          containerVarItem.newPrice != null ? containerVarItem.newPrice : containerVarItem.price,
                                                                                          0,
                                                                                        ) * (columnAplicationRow!.markup!) / 100)).toString()} ₽ ',
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
                                                                            Text(
                                                                              ' x${containerVarItem.newQuantity != null ? containerVarItem.newQuantity?.toString() : containerVarItem.quantity?.toString()}',
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
                                                                            Text(
                                                                              '${((containerVarItem.newQuantity != null ? containerVarItem.newQuantity! : containerVarItem.quantity!) * (valueOrDefault<int>(
                                                                                    containerVarItem.newPrice != null ? containerVarItem.newPrice : containerVarItem.price,
                                                                                    0,
                                                                                  ) + (valueOrDefault<int>(
                                                                                        containerVarItem.newPrice != null ? containerVarItem.newPrice : containerVarItem.price,
                                                                                        0,
                                                                                      ) * (columnAplicationRow.markup!) / 100))).toString()} ₽',
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
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Builder(
                                                          builder: (context) {
                                                            final containerVar =
                                                                containerWorkAnswerRowList
                                                                    .where((e) =>
                                                                        (e.quantity !=
                                                                            null) &&
                                                                        (e.price !=
                                                                            null))
                                                                    .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                2.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  containerVar
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                              itemBuilder: (context,
                                                                  containerVarIndex) {
                                                                final containerVarItem =
                                                                    containerVar[
                                                                        containerVarIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            5.0,
                                                                            15.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            containerVarItem.nameWork,
                                                                            ' Название работ',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Text(
                                                                                '${((containerVarItem.price!) + ((containerVarItem.price!) * (columnAplicationRow!.markup!) / 100)).toString()} ₽ ',
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
                                                                            ),
                                                                            Text(
                                                                              ' x${containerVarItem.quantity?.toString()}',
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
                                                                              '${((containerVarItem.quantity!) * ((containerVarItem.price!) + ((containerVarItem.price!) * (columnAplicationRow.markup!) / 100))).toString()} ₽',
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
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
