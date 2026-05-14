import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/components/list_application_plug_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/menu_p_c/menu_p_c_widget.dart';
import '/general/mobile_menu/mobile_menu_widget.dart';
import '/general/notifications/notifications_widget.dart';
import 'dart:async';
import '/index.dart';
import 'general1_widget.dart' show General1Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class General1Model extends FlutterFlowModel<General1Widget> {
  ///  Local state fields for this page.

  String tab = 'Активные';

  bool tablet = true;

  List<String> statusList = ['Создана', 'В работе'];
  void addToStatusList(String item) => statusList.add(item);
  void removeFromStatusList(String item) => statusList.remove(item);
  void removeAtIndexFromStatusList(int index) => statusList.removeAt(index);
  void insertAtIndexInStatusList(int index, String item) =>
      statusList.insert(index, item);
  void updateStatusListAtIndex(int index, Function(String) updateFn) =>
      statusList[index] = updateFn(statusList[index]);

  int? filterCity;

  DateTime? filterDate1;

  DateTime? filterDate2;

  List<String> jobStatus = ['Создана', 'В работе'];
  void addToJobStatus(String item) => jobStatus.add(item);
  void removeFromJobStatus(String item) => jobStatus.remove(item);
  void removeAtIndexFromJobStatus(int index) => jobStatus.removeAt(index);
  void insertAtIndexInJobStatus(int index, String item) =>
      jobStatus.insert(index, item);
  void updateJobStatusAtIndex(int index, Function(String) updateFn) =>
      jobStatus[index] = updateFn(jobStatus[index]);

  List<String> actionApplication = ['Создана', 'В работе'];
  void addToActionApplication(String item) => actionApplication.add(item);
  void removeFromActionApplication(String item) =>
      actionApplication.remove(item);
  void removeAtIndexFromActionApplication(int index) =>
      actionApplication.removeAt(index);
  void insertAtIndexInActionApplication(int index, String item) =>
      actionApplication.insert(index, item);
  void updateActionApplicationAtIndex(int index, Function(String) updateFn) =>
      actionApplication[index] = updateFn(actionApplication[index]);

  List<String> cancel = ['Отменена'];
  void addToCancel(String item) => cancel.add(item);
  void removeFromCancel(String item) => cancel.remove(item);
  void removeAtIndexFromCancel(int index) => cancel.removeAt(index);
  void insertAtIndexInCancel(int index, String item) =>
      cancel.insert(index, item);
  void updateCancelAtIndex(int index, Function(String) updateFn) =>
      cancel[index] = updateFn(cancel[index]);

  List<String> completed = ['Завершена', 'Отменена'];
  void addToCompleted(String item) => completed.add(item);
  void removeFromCompleted(String item) => completed.remove(item);
  void removeAtIndexFromCompleted(int index) => completed.removeAt(index);
  void insertAtIndexInCompleted(int index, String item) =>
      completed.insert(index, item);
  void updateCompletedAtIndex(int index, Function(String) updateFn) =>
      completed[index] = updateFn(completed[index]);

  /// Индикатор того что страница обновила апстайт
  bool pageReady = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? applicationCreateController;
  // Stores action output result for [Backend Call - Query Rows] action in general_1 widget.
  List<UserRow>? queryUser;
  // Stores action output result for [Custom Action - getFcmToken] action in general_1 widget.
  String? fcmToken;
  // Stores action output result for [Backend Call - Query Rows] action in general_1 widget.
  List<SettingsRow>? settingsQuery;
  // Stores action output result for [Backend Call - Query Rows] action in general_1 widget.
  List<AppStateUserRow>? queryAppStateUser;
  // Stores action output result for [Custom Action - syncDraftsWithSupabase] action in general_1 widget.
  List<dynamic>? syncDrafts;
  Completer<List<NotificationsRow>>? requestCompleter2;
  // Model for menuPC component.
  late MenuPCModel menuPCModel;
  Stream<List<AplicationRow>>? containQueryApplicationSupabaseStream;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  ChatRow? insertChat;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<SettingsRow>? querySetting;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ChatRow>? cahatAdmin;
  Stream<List<NotificationAdminRow>>? containerSupabaseStream;
  // Model for notifications component.
  late NotificationsModel notificationsModel1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for button_48_48 component.
  late Button4848Model button4848Model;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonAction widget.
  List<NotificationsRow>? updateNotification;
  // Model for notifications component.
  late NotificationsModel notificationsModel2;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification2;
  // Model for notifications component.
  late NotificationsModel notificationsModel3;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification3;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification4;
  // Model for notifications component.
  late NotificationsModel notificationsModel4;
  // Model for listApplicationPlug component.
  late ListApplicationPlugModel listApplicationPlugModel;
  // Model for mobileMenu component.
  late MobileMenuModel mobileMenuModel;

  @override
  void initState(BuildContext context) {
    menuPCModel = createModel(context, () => MenuPCModel());
    notificationsModel1 = createModel(context, () => NotificationsModel());
    button4848Model = createModel(context, () => Button4848Model());
    notificationsModel2 = createModel(context, () => NotificationsModel());
    notificationsModel3 = createModel(context, () => NotificationsModel());
    notificationsModel4 = createModel(context, () => NotificationsModel());
    listApplicationPlugModel =
        createModel(context, () => ListApplicationPlugModel());
    mobileMenuModel = createModel(context, () => MobileMenuModel());
  }

  @override
  void dispose() {
    applicationCreateController?.finish();
    menuPCModel.dispose();
    notificationsModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    button4848Model.dispose();
    notificationsModel2.dispose();
    notificationsModel3.dispose();
    notificationsModel4.dispose();
    listApplicationPlugModel.dispose();
    mobileMenuModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
