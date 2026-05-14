import '../database.dart';

class ApplicationBlancDocTable extends SupabaseTable<ApplicationBlancDocRow> {
  @override
  String get tableName => 'application_blanc_doc';

  @override
  ApplicationBlancDocRow createRow(Map<String, dynamic> data) =>
      ApplicationBlancDocRow(data);
}

class ApplicationBlancDocRow extends SupabaseDataRow {
  ApplicationBlancDocRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApplicationBlancDocTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  int? get stampAndSignature => getField<int>('stamp_and_signature');
  set stampAndSignature(int? value) =>
      setField<int>('stamp_and_signature', value);

  String? get nameDoc => getField<String>('name_doc');
  set nameDoc(String? value) => setField<String>('name_doc', value);

  String? get linkDoc => getField<String>('link_doc');
  set linkDoc(String? value) => setField<String>('link_doc', value);
}
