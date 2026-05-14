import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_info_list_model.dart';
export 'text_info_list_model.dart';

/// текст для отображения если список не загрузился или пустой
class TextInfoListWidget extends StatefulWidget {
  const TextInfoListWidget({
    super.key,
    String? text,
  }) : this.text = text ?? 'текст';

  /// текст инфы
  final String text;

  @override
  State<TextInfoListWidget> createState() => _TextInfoListWidgetState();
}

class _TextInfoListWidgetState extends State<TextInfoListWidget> {
  late TextInfoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextInfoListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.montserrat(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
    );
  }
}
