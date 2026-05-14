import '/flutter_flow/flutter_flow_util.dart';
import '/onbording/onbording_image_titele/onbording_image_titele_widget.dart';
import '/index.dart';
import 'onbording1_widget.dart' show Onbording1Widget;
import 'package:flutter/material.dart';

class Onbording1Model extends FlutterFlowModel<Onbording1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for onbordingImageTitele component.
  late OnbordingImageTiteleModel onbordingImageTiteleModel1;
  // Model for onbordingImageTitele component.
  late OnbordingImageTiteleModel onbordingImageTiteleModel2;
  // Model for onbordingImageTitele component.
  late OnbordingImageTiteleModel onbordingImageTiteleModel3;

  @override
  void initState(BuildContext context) {
    onbordingImageTiteleModel1 =
        createModel(context, () => OnbordingImageTiteleModel());
    onbordingImageTiteleModel2 =
        createModel(context, () => OnbordingImageTiteleModel());
    onbordingImageTiteleModel3 =
        createModel(context, () => OnbordingImageTiteleModel());
  }

  @override
  void dispose() {
    onbordingImageTiteleModel1.dispose();
    onbordingImageTiteleModel2.dispose();
    onbordingImageTiteleModel3.dispose();
  }
}
