import '/backend/supabase/supabase.dart';
import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/text_fild/text_fild_widget.dart';
import 'package:flutter/material.dart';
import 'profil_edit_post_employe_model.dart';
export 'profil_edit_post_employe_model.dart';

class ProfilEditPostEmployeWidget extends StatefulWidget {
  const ProfilEditPostEmployeWidget({
    super.key,
    required this.idEmploye,
  });

  final int? idEmploye;

  static String routeName = 'profil_edit_post_employe';
  static String routePath = 'profilEditPostEmploye';

  @override
  State<ProfilEditPostEmployeWidget> createState() =>
      _ProfilEditPostEmployeWidgetState();
}

class _ProfilEditPostEmployeWidgetState
    extends State<ProfilEditPostEmployeWidget> {
  late ProfilEditPostEmployeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilEditPostEmployeModel());

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
                            text: 'Должность сотрудника',
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0,
                                0.0,
                                24.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width >
                                          MediaQuery.sizeOf(context).height
                                      ? 58.0
                                      : 22.0,
                                  0.0,
                                )),
                            child: FutureBuilder<List<UserRow>>(
                              future: UserTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  widget.idEmploye,
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
                                List<UserRow> columnUserRowList =
                                    snapshot.data!;

                                final columnUserRow =
                                    columnUserRowList.isNotEmpty
                                        ? columnUserRowList.first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 700.0,
                                      decoration: BoxDecoration(),
                                      child: wrapWithModel(
                                        model: _model.textFildModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: TextFildWidget(
                                          text1: 'Введите должность сотрудника',
                                          text2: columnUserRow?.position,
                                          action: (text) async {},
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.button70048BlueModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: Button70048BlueWidget(
                                        text: 'Сохранить',
                                        flagButton: false,
                                        actionButton: () async {
                                          await UserTable().update(
                                            data: {
                                              'position': _model.textFildModel
                                                  .textController.text,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.idEmploye,
                                            ),
                                          );
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                  ],
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
