import '/button/raund_picture44/raund_picture44_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'info_application_widget.dart' show InfoApplicationWidget;
import 'package:flutter/material.dart';

class InfoApplicationModel extends FlutterFlowModel<InfoApplicationWidget> {
  ///  Local state fields for this component.

  String? linkDocApplication;

  bool cust1 = false;

  bool cust2 = false;

  bool execut = false;

  /// скрыть новый элемент
  bool hideElements = false;

  ///  State fields for stateful widgets in this component.

  // Model for raundPicture44 component.
  late RaundPicture44Model raundPicture44Model1;
  // Stores action output result for [Custom Action - createApplicationDocPdf] action in IconButton widget.
  String? urlDocApplicationBlanc;
  // Model for raundPicture44 component.
  late RaundPicture44Model raundPicture44Model2;
  // Model for raundPicture44 component.
  late RaundPicture44Model raundPicture44Model3;
  // Model for raundPicture44 component.
  late RaundPicture44Model raundPicture44Model4;
  // Model for raundPicture44 component.
  late RaundPicture44Model raundPicture44Model5;

  @override
  void initState(BuildContext context) {
    raundPicture44Model1 = createModel(context, () => RaundPicture44Model());
    raundPicture44Model2 = createModel(context, () => RaundPicture44Model());
    raundPicture44Model3 = createModel(context, () => RaundPicture44Model());
    raundPicture44Model4 = createModel(context, () => RaundPicture44Model());
    raundPicture44Model5 = createModel(context, () => RaundPicture44Model());
  }

  @override
  void dispose() {
    raundPicture44Model1.dispose();
    raundPicture44Model2.dispose();
    raundPicture44Model3.dispose();
    raundPicture44Model4.dispose();
    raundPicture44Model5.dispose();
  }
}
