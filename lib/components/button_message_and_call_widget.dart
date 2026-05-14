import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'button_message_and_call_model.dart';
export 'button_message_and_call_model.dart';

class ButtonMessageAndCallWidget extends StatefulWidget {
  const ButtonMessageAndCallWidget({
    super.key,
    int? idChat,
    int? userExecuter,
    int? idApplication,
  })  : this.idChat = idChat ?? 0,
        this.userExecuter = userExecuter ?? 0,
        this.idApplication = idApplication ?? 0;

  final int idChat;
  final int userExecuter;
  final int idApplication;

  @override
  State<ButtonMessageAndCallWidget> createState() =>
      _ButtonMessageAndCallWidgetState();
}

class _ButtonMessageAndCallWidgetState
    extends State<ButtonMessageAndCallWidget> {
  late ButtonMessageAndCallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonMessageAndCallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).warning,
            borderRadius: 8.0,
            borderWidth: 1.0,
            buttonSize: 48.0,
            fillColor: FlutterFlowTheme.of(context).warning,
            icon: Icon(
              FFIcons.kproperty1Chat,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            onPressed: () async {
              if ((widget.idChat != null) && (widget.idChat != 0)) {
                context.pushNamed(
                  Chat2Widget.routeName,
                  queryParameters: {
                    'idChat': serializeParam(
                      widget.idChat,
                      ParamType.int,
                    ),
                    'idResipient': serializeParam(
                      widget.userExecuter,
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
              } else {
                _model.newChat1 = await ChatTable().insert({
                  'user carrier': FFAppState().myID,
                  'user ware house': widget.userExecuter,
                  'application': widget.idApplication,
                });
                await AplicationTable().update(
                  data: {
                    'chatID': _model.newChat1?.id,
                  },
                  matchingRows: (rows) => rows.eqOrNull(
                    'id',
                    widget.idApplication,
                  ),
                );

                context.pushNamed(
                  Chat2Widget.routeName,
                  queryParameters: {
                    'idChat': serializeParam(
                      _model.newChat1?.id,
                      ParamType.int,
                    ),
                    'idResipient': serializeParam(
                      widget.userExecuter,
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
              }

              safeSetState(() {});
            },
          ),
        ),
        if ((isAndroid == true) || (isiOS == true))
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 48.0,
            fillColor: FlutterFlowTheme.of(context).success,
            icon: Icon(
              FFIcons.kproperty1phone1,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            onPressed: () async {
              _model.queryUserExecuter = await UserTable().queryRows(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  widget.userExecuter,
                ),
              );
              await launchUrl(Uri(
                scheme: 'tel',
                path: _model.queryUserExecuter!.firstOrNull!.phoneUser!,
              ));

              safeSetState(() {});
            },
          ),
      ].divide(SizedBox(width: 10.0)),
    );
  }
}
