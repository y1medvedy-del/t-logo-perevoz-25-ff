import '/ananimus/menu_p_c_ananimus/menu_p_c_ananimus_widget.dart';
import '/ananimus/mobile_menu_ananimus/mobile_menu_ananimus_widget.dart';
import '/backend/supabase/supabase.dart';
import '/components/button4848_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/general/notifications/notifications_widget.dart';
import 'dart:async';
import '/index.dart';
import 'general1_ananimus_widget.dart' show General1AnanimusWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class General1AnanimusModel extends FlutterFlowModel<General1AnanimusWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Model for menuPC_Ananimus component.
  late MenuPCAnanimusModel menuPCAnanimusModel;
  Stream<List<NotificationAdminRow>>? containerSupabaseStream;
  // Model for notifications component.
  late NotificationsModel notificationsModel;
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
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification2;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification3;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<NotificationsRow>? updateNotification4;
  Stream<List<AplicationRow>>? actionSupabaseStream;
  // Model for mobileMenu_Ananimus component.
  late MobileMenuAnanimusModel mobileMenuAnanimusModel;

  @override
  void initState(BuildContext context) {
    menuPCAnanimusModel = createModel(context, () => MenuPCAnanimusModel());
    notificationsModel = createModel(context, () => NotificationsModel());
    button4848Model = createModel(context, () => Button4848Model());
    mobileMenuAnanimusModel =
        createModel(context, () => MobileMenuAnanimusModel());
  }

  @override
  void dispose() {
    menuPCAnanimusModel.dispose();
    notificationsModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    button4848Model.dispose();
    mobileMenuAnanimusModel.dispose();
  }
}
