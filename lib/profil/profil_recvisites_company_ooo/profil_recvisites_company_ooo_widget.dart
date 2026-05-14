import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/row_next_text/row_next_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profil_recvisites_company_ooo_model.dart';
export 'profil_recvisites_company_ooo_model.dart';

class ProfilRecvisitesCompanyOooWidget extends StatefulWidget {
  const ProfilRecvisitesCompanyOooWidget({super.key});

  static String routeName = 'profil_recvisites_company_ooo';
  static String routePath = 'profilRecvisitesCompanyOoo';

  @override
  State<ProfilRecvisitesCompanyOooWidget> createState() =>
      _ProfilRecvisitesCompanyOooWidgetState();
}

class _ProfilRecvisitesCompanyOooWidgetState
    extends State<ProfilRecvisitesCompanyOooWidget> {
  late ProfilRecvisitesCompanyOooModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilRecvisitesCompanyOooModel());

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.returneMenuModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ReturneMenuWidget(
                            text: 'Данные о компании',
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FutureBuilder<List<CompanyRow>>(
                              future: CompanyTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CompanyRow> containerCompanyRowList =
                                    snapshot.data!;

                                final containerCompanyRow =
                                    containerCompanyRowList.isNotEmpty
                                        ? containerCompanyRowList.first
                                        : null;

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
                                              ? 52.0
                                              : 30.0,
                                          0.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'КПП',
                                                    text2: containerCompanyRow
                                                        ?.kpp,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'ОГРН',
                                                    text2: containerCompanyRow
                                                        ?.ogrn,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'ОКПО',
                                                    text2: containerCompanyRow
                                                        ?.okpo,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel4,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'ОКВЭД',
                                                    text2: containerCompanyRow
                                                        ?.okved,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel5,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'Юр. адрес',
                                                    text2: containerCompanyRow
                                                        ?.rUrAddress,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.rowNextTextModel6,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: RowNextTextWidget(
                                                    text1: 'Факт. адрес',
                                                    text2: containerCompanyRow
                                                        ?.rFactAddress,
                                                    actionRow: () async {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextModel7,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RowNextTextWidget(
                                                      text1: 'Р/с',
                                                      text2: containerCompanyRow
                                                          ?.paymentAccount,
                                                      actionRow: () async {},
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextModel8,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RowNextTextWidget(
                                                      text1: 'Название банка',
                                                      text2: containerCompanyRow
                                                          ?.nnameBank,
                                                      actionRow: () async {},
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextModel9,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RowNextTextWidget(
                                                      text1: 'БИК',
                                                      text2: containerCompanyRow
                                                          ?.bik,
                                                      actionRow: () async {},
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextModel10,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RowNextTextWidget(
                                                      text1: 'Кор/счет',
                                                      text2: containerCompanyRow
                                                          ?.correspondentAccount,
                                                      actionRow: () async {},
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .rowNextTextModel11,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RowNextTextWidget(
                                                      text1: 'НДС',
                                                      text2: containerCompanyRow
                                                                  ?.nds ==
                                                              true
                                                          ? 'Да'
                                                          : 'Нет',
                                                      actionRow: () async {},
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
            ],
          ),
        ),
      ),
    );
  }
}
