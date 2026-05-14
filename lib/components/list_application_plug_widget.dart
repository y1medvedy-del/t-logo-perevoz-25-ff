import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_application_plug_model.dart';
export 'list_application_plug_model.dart';

/// Заглушка для списка заявок на главной странице
class ListApplicationPlugWidget extends StatefulWidget {
  const ListApplicationPlugWidget({super.key});

  @override
  State<ListApplicationPlugWidget> createState() =>
      _ListApplicationPlugWidgetState();
}

class _ListApplicationPlugWidgetState extends State<ListApplicationPlugWidget> {
  late ListApplicationPlugModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListApplicationPlugModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/t-logo-so4o3e/assets/shxu95ld7f1t/Frame_1321318621.png',
            width: 169.0,
            height: 130.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
