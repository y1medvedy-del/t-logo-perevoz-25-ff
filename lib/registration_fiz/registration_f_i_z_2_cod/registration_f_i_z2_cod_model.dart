import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'registration_f_i_z2_cod_widget.dart' show RegistrationFIZ2CodWidget;
import 'package:flutter/material.dart';

class RegistrationFIZ2CodModel
    extends FlutterFlowModel<RegistrationFIZ2CodWidget> {
  ///  Local state fields for this page.

  bool offer = false;

  /// ошибка кода
  bool error = false;

  /// повторное сообщение
  bool repiteSms = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - verifyPhoneOtp] action in Button widget.
  bool? infoVeriflyPhoneOtp;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UserRow>? queryUser;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
