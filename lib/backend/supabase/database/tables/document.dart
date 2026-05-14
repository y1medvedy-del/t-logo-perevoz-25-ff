import '../database.dart';

class DocumentTable extends SupabaseTable<DocumentRow> {
  @override
  String get tableName => 'document';

  @override
  DocumentRow createRow(Map<String, dynamic> data) => DocumentRow(data);
}

class DocumentRow extends SupabaseDataRow {
  DocumentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idUser => getField<int>('id user');
  set idUser(int? value) => setField<int>('id user', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  bool? get abilityDelete => getField<bool>('ability_delete');
  set abilityDelete(bool? value) => setField<bool>('ability_delete', value);

  bool? get check => getField<bool>('check');
  set check(bool? value) => setField<bool>('check', value);

  bool? get blockingOwenCompany => getField<bool>('blocking_owen_company');
  set blockingOwenCompany(bool? value) =>
      setField<bool>('blocking_owen_company', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get reasonRefusal => getField<String>('reason_refusal');
  set reasonRefusal(String? value) => setField<String>('reason_refusal', value);
}
