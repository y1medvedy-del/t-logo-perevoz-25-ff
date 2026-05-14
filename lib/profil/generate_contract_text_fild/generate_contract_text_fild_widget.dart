import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'generate_contract_text_fild_model.dart';
export 'generate_contract_text_fild_model.dart';

/// текст филд для заполнения данных контракта
class GenerateContractTextFildWidget extends StatefulWidget {
  const GenerateContractTextFildWidget({
    super.key,
    required this.title,
    required this.textFildInital,
    required this.action,
  });

  /// Описание окна
  final String? title;

  /// Текст окна
  final String? textFildInital;

  /// Действие возращающее текст окна
  final Future Function(

      /// текст окна textFild
      String value,

      /// key json
      String keyJson)? action;

  @override
  State<GenerateContractTextFildWidget> createState() =>
      _GenerateContractTextFildWidgetState();
}

class _GenerateContractTextFildWidgetState
    extends State<GenerateContractTextFildWidget> {
  late GenerateContractTextFildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateContractTextFildModel());

    _model.textFildTextController ??=
        TextEditingController(text: widget.textFildInital);
    _model.textFildFocusNode ??= FocusNode();
    _model.textFildFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget.title,
            ' Текст',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.montserrat(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
        TextFormField(
          controller: _model.textFildTextController,
          focusNode: _model.textFildFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textFildTextController',
            Duration(milliseconds: 0),
            () async {
              await widget.action?.call(
                _model.textFildTextController.text,
                widget.title!,
              );
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: false,
            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            alignLabelWithHint: false,
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).accent2,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.montserrat(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          maxLines: null,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator:
              _model.textFildTextControllerValidator.asValidator(context),
        ),
      ],
    );
  }
}
