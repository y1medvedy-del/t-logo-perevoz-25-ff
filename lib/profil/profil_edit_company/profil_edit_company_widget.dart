import '/components/button70048_blue_widget.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profil/text_fild/text_fild_widget.dart';
import 'package:flutter/material.dart';
import 'profil_edit_company_model.dart';
export 'profil_edit_company_model.dart';

class ProfilEditCompanyWidget extends StatefulWidget {
  const ProfilEditCompanyWidget({super.key});

  static String routeName = 'profil_edit_company';
  static String routePath = 'profilEditCompany';

  @override
  State<ProfilEditCompanyWidget> createState() =>
      _ProfilEditCompanyWidgetState();
}

class _ProfilEditCompanyWidgetState extends State<ProfilEditCompanyWidget> {
  late ProfilEditCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilEditCompanyModel());

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
                            text: 'Компания',
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 700.0,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.textFildModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextFildWidget(
                                      text1: 'Введите название компании',
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
                                    actionButton: () async {},
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
            ],
          ),
        ),
      ),
    );
  }
}
