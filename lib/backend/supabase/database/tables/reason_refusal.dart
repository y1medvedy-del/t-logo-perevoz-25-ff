import '../database.dart';

class ReasonRefusalTable extends SupabaseTable<ReasonRefusalRow> {
  @override
  String get tableName => 'reason_refusal';

  @override
  ReasonRefusalRow createRow(Map<String, dynamic> data) =>
      ReasonRefusalRow(data);
}

class ReasonRefusalRow extends SupabaseDataRow {
  ReasonRefusalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReasonRefusalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get regUser => getField<bool>('reg_user');
  set regUser(bool? value) => setField<bool>('reg_user', value);

  bool? get docCompany => getField<bool>('doc_company');
  set docCompany(bool? value) => setField<bool>('doc_company', value);
}
