import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'asdasdgsdgsdfgsdfgs_model.dart';
export 'asdasdgsdgsdfgsdfgs_model.dart';

class AsdasdgsdgsdfgsdfgsWidget extends StatefulWidget {
  const AsdasdgsdgsdfgsdfgsWidget({super.key});

  static String routeName = 'asdasdgsdgsdfgsdfgs';
  static String routePath = 'asdasdgsdgsdfgsdfgs';

  @override
  State<AsdasdgsdgsdfgsdfgsWidget> createState() =>
      _AsdasdgsdgsdfgsdfgsWidgetState();
}

class _AsdasdgsdgsdfgsdfgsWidgetState extends State<AsdasdgsdgsdfgsdfgsWidget> {
  late AsdasdgsdgsdfgsdfgsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsdasdgsdgsdfgsdfgsModel());

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
            children: [
              Lottie.asset(
                'assets/jsons/eyes.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/Timer2_.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/Notification_Animal.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/Notification.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/Timer2.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/search.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/clock_is_grey.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/jsons/Animation_-_1738903127136.json',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                animate: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
