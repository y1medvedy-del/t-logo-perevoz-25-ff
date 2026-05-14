import '../database.dart';

class MarkupPraceTable extends SupabaseTable<MarkupPraceRow> {
  @override
  String get tableName => 'markup_prace';

  @override
  MarkupPraceRow createRow(Map<String, dynamic> data) => MarkupPraceRow(data);
}

class MarkupPraceRow extends SupabaseDataRow {
  MarkupPraceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarkupPraceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get procent => getField<int>('procent');
  set procent(int? value) => setField<int>('procent', value);

  bool? get defaultField => getField<bool>('default');
  set defaultField(bool? value) => setField<bool>('default', value);
}
