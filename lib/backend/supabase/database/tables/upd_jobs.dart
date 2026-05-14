import '../database.dart';

class UpdJobsTable extends SupabaseTable<UpdJobsRow> {
  @override
  String get tableName => 'upd_jobs';

  @override
  UpdJobsRow createRow(Map<String, dynamic> data) => UpdJobsRow(data);
}

class UpdJobsRow extends SupabaseDataRow {
  UpdJobsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UpdJobsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get applicationId => getField<int>('application_id')!;
  set applicationId(int value) => setField<int>('application_id', value);

  String get docNumber => getField<String>('doc_number')!;
  set docNumber(String value) => setField<String>('doc_number', value);

  String? get baseDoc => getField<String>('base_doc');
  set baseDoc(String? value) => setField<String>('base_doc', value);

  int? get ndsPercent => getField<int>('nds_percent');
  set ndsPercent(int? value) => setField<int>('nds_percent', value);

  bool? get ndsMode => getField<bool>('nds_mode');
  set ndsMode(bool? value) => setField<bool>('nds_mode', value);

  String? get statusUpd => getField<String>('status_upd');
  set statusUpd(String? value) => setField<String>('status_upd', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get resultUrl => getField<String>('result_url');
  set resultUrl(String? value) => setField<String>('result_url', value);

  String? get error => getField<String>('error');
  set error(String? value) => setField<String>('error', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
