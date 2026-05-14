import '/backend/supabase/supabase.dart';
import '/components/returne_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'profil_document_widget.dart' show ProfilDocumentWidget;
import 'package:flutter/material.dart';

class ProfilDocumentModel extends FlutterFlowModel<ProfilDocumentWidget> {
  ///  Local state fields for this page.

  String? pyamentTypeSelect;

  ///  State fields for stateful widgets in this page.

  // Model for returne_menu component.
  late ReturneMenuModel returneMenuModel;
  Completer<List<DocumentContractRow>>? requestCompleter2;
  // Stores action output result for [Custom Action - generateAndUploadContractPdfCarrier] action in Icon widget.
  String? newLinkContractDocument;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ContractClausesRow>? qweryContactClauses;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<DocumentContractRow>? qweryDocumentContract;
  bool isDataUploading_uploadContractDocument = false;
  FFUploadedFile uploadedLocalFile_uploadContractDocument =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadContractDocument = '';

  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ContractClausesRow>? qweryContactClausesCopy;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<DocumentContractRow>? qweryDocumentContractCopy;
  Completer<List<CompanyRow>>? requestCompleter1;
  bool isDataUploading_uploadDataSignature = false;
  FFUploadedFile uploadedLocalFile_uploadDataSignature =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSignature = '';

  bool isDataUploading_uploadDataStamp = false;
  FFUploadedFile uploadedLocalFile_uploadDataStamp =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataStamp = '';

  bool isDataUploading_uploadDocCompany = false;
  FFUploadedFile uploadedLocalFile_uploadDocCompany =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDocCompany = '';

  @override
  void initState(BuildContext context) {
    returneMenuModel = createModel(context, () => ReturneMenuModel());
  }

  @override
  void dispose() {
    returneMenuModel.dispose();
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

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
