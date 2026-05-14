import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_video_camera_and_gellery_model.dart';
export 'chat_video_camera_and_gellery_model.dart';

class ChatVideoCameraAndGelleryWidget extends StatefulWidget {
  const ChatVideoCameraAndGelleryWidget({
    super.key,
    required this.idChat,
    required this.textMessage,
  });

  final int? idChat;
  final String? textMessage;

  @override
  State<ChatVideoCameraAndGelleryWidget> createState() =>
      _ChatVideoCameraAndGelleryWidgetState();
}

class _ChatVideoCameraAndGelleryWidgetState
    extends State<ChatVideoCameraAndGelleryWidget> {
  late ChatVideoCameraAndGelleryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatVideoCameraAndGelleryModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
        child: Container(
          width: 240.0,
          height: 105.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 79.0,
                height: 81.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia = await selectMedia(
                            storageFolderPath: 'videoMessegePerevozGellery',
                            isVideo: true,
                            mediaSource: MediaSource.videoGallery,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() =>
                                _model.isDataUploading_uploadData2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                        originalFilename: m.originalFilename,
                                      ))
                                  .toList();

                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'docChat',
                                selectedFiles: selectedMedia,
                              );
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading_uploadData2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadData2 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_uploadData2 =
                                    downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              safeSetState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }

                          if (_model.uploadedFileUrl_uploadData2 != '') {
                            unawaited(
                              () async {
                                _model.messagPhotoCopy =
                                    await MessageTable().insert({
                                  'chat_id': widget.idChat,
                                  'sender': FFAppState().myID,
                                  'text': widget.textMessage,
                                  'video_message':
                                      _model.uploadedFileUrl_uploadData2,
                                });
                              }(),
                            );
                            unawaited(
                              () async {
                                await ChatTable().update(
                                  data: {
                                    'last message date':
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                    'last message time':
                                        supaSerialize<PostgresTime>(
                                            PostgresTime(getCurrentTimestamp)),
                                    'last message': 'Видео',
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.idChat,
                                  ),
                                );
                              }(),
                            );

                            safeSetState(() {});
                            Navigator.pop(context);
                          }

                          safeSetState(() {});
                        },
                        text: '',
                        icon: Icon(
                          FFIcons.kproperty1download,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: 60.0,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).warning,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Text(
                      'Галерея',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF828282),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 79.0,
                height: 81.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia = await selectMedia(
                            storageFolderPath: 'videoMessegePerevozCam',
                            isVideo: true,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model
                                .isDataUploading_uploadDataVideoCam = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                        originalFilename: m.originalFilename,
                                      ))
                                  .toList();

                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'docChat',
                                selectedFiles: selectedMedia,
                              );
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading_uploadDataVideoCam = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadDataVideoCam =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_uploadDataVideoCam =
                                    downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              safeSetState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload data');
                              return;
                            }
                          }

                          if (_model.uploadedFileUrl_uploadDataVideoCam != '') {
                            unawaited(
                              () async {
                                _model.messagPhoto =
                                    await MessageTable().insert({
                                  'chat_id': widget.idChat,
                                  'sender': FFAppState().myID,
                                  'text': widget.textMessage,
                                  'video_message':
                                      _model.uploadedFileUrl_uploadDataVideoCam,
                                });
                              }(),
                            );
                            unawaited(
                              () async {
                                await ChatTable().update(
                                  data: {
                                    'last message date':
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                    'last message time':
                                        supaSerialize<PostgresTime>(
                                            PostgresTime(getCurrentTimestamp)),
                                    'last message': 'Видео',
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    widget.idChat,
                                  ),
                                );
                              }(),
                            );

                            safeSetState(() {});
                            Navigator.pop(context);
                          }

                          safeSetState(() {});
                        },
                        text: '',
                        icon: Icon(
                          FFIcons.kproperty1camera,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: 60.0,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Text(
                      'Камера',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF828282),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 31.0)),
          ),
        ),
      ),
    );
  }
}
