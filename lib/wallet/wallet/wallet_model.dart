import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/general/mobile_menu/mobile_menu_widget.dart';
import 'dart:async';
import '/index.dart';
import 'wallet_widget.dart' show WalletWidget;
import 'package:flutter/material.dart';

class WalletModel extends FlutterFlowModel<WalletWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkFineValidity] action in wallet widget.
  String? checkFineVali;
  Completer<List<FineRow>>? requestCompleter;
  // Model for menuPC component.
  late MenuPCModel menuPCModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_48_48 component.
  late Button4848Model button4848Model;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SettingsRow>? setting;
  bool isDataUploading_uploadPayment = false;
  FFUploadedFile uploadedLocalFile_uploadPayment =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPayment = '';

  // Model for mobileMenu component.
  late MobileMenuModel mobileMenuModel;

  @override
  void initState(BuildContext context) {
    menuPCModel = createModel(context, () => MenuPCModel());
    button4848Model = createModel(context, () => Button4848Model());
    mobileMenuModel = createModel(context, () => MobileMenuModel());
  }

  @override
  void dispose() {
    menuPCModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    button4848Model.dispose();
    tabBarController?.dispose();
    mobileMenuModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
