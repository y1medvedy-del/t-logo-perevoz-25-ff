import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onbording/onbording_image_titele/onbording_image_titele_widget.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onbording1_model.dart';
export 'onbording1_model.dart';

class Onbording1Widget extends StatefulWidget {
  const Onbording1Widget({
    super.key,
    this.companyID,
  });

  final int? companyID;

  static String routeName = 'onbording_1';
  static String routePath = 'onbording1';

  @override
  State<Onbording1Widget> createState() => _Onbording1WidgetState();
}

class _Onbording1WidgetState extends State<Onbording1Widget> {
  late Onbording1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onbording1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().firstVisit != true) {
        context.pushNamed(Onbording2Widget.routeName);
      }
    });

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
        backgroundColor: Color(0xFFE6EEF5),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          wrapWithModel(
                            model: _model.onbordingImageTiteleModel1,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: OnbordingImageTiteleWidget(
                              image:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/iq2xe2sce74j/OB_car_pic_1.png',
                              text1: 'Создавайте заявки',
                              text2:
                                  'С помощью приложения формируйте заявки на складские услуги',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.onbordingImageTiteleModel2,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: OnbordingImageTiteleWidget(
                              image:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/5ze97sbpmjsm/OB_car_pic_2.png',
                              text1: 'Выбирайте исполнителя',
                              text2:
                                  'Получайте своевременные отклики и выбирайте наиболее подходящие',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.onbordingImageTiteleModel3,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: OnbordingImageTiteleWidget(
                              image:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/7tbon2jcda6z/Ob_car_pic_4.png',
                              text1: 'Контролируйте работу',
                              text2:
                                  'Отслеживайте статус работы \nи общайтесь с исполнителем в чате',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 0.0, 16.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 6.0,
                            radius: 4.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).accent1,
                            activeDotColor:
                                FlutterFlowTheme.of(context).primary,
                            paintStyle: PaintingStyle.stroke,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    24.0,
                    0.0,
                    24.0,
                    valueOrDefault<double>(
                      isWeb ? 58.0 : 46.0,
                      0.0,
                    )),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.pageViewCurrentIndex.toString() == '2') {
                      context.pushNamed(
                        Onbording2Widget.routeName,
                        queryParameters: {
                          'companyID': serializeParam(
                            widget.companyID,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );

                      FFAppState().firstVisit = false;
                      safeSetState(() {});
                    } else {
                      await _model.pageViewController?.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  text: 'Далее',
                  options: FFButtonOptions(
                    width: 700.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
            ],
          ),
        ),
      ),
    );
  }
}
