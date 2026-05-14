import '/creating_apllcationi/a_cap_close/a_cap_close_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wallet_web_view_model.dart';
export 'wallet_web_view_model.dart';

class WalletWebViewWidget extends StatefulWidget {
  const WalletWebViewWidget({
    super.key,
    required this.summ,
    required this.replaceOutput,
    required this.urlPayment,
    required this.paymentId,
    required this.orderId,
  });

  final double? summ;
  final bool? replaceOutput;

  /// ссылка на форму оплаты
  final String? urlPayment;

  /// Идентификатор платежа, который вернула серверная функция
  final String? paymentId;

  /// Внутренний номер заказа/платежа в нашей системе
  final String? orderId;

  static String routeName = 'wallet_web_view';
  static String routePath = 'walletWebView';

  @override
  State<WalletWebViewWidget> createState() => _WalletWebViewWidgetState();
}

class _WalletWebViewWidgetState extends State<WalletWebViewWidget> {
  late WalletWebViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletWebViewModel());

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
                          model: _model.aCapCloseModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ACapCloseWidget(
                            text: valueOrDefault<String>(
                              widget.replaceOutput! ? 'Пополнеие' : 'Вывод',
                              'Пополнение кошелька',
                            ),
                            creatinStage: 0,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: FlutterFlowWebView(
                              content: valueOrDefault<String>(
                                widget.urlPayment,
                                'https://example.com',
                              ),
                              bypass: false,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              verticalScroll: false,
                              horizontalScroll: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {},
                        text: 'Проверить оплату',
                        options: FFButtonOptions(
                          width: 700.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
