import '../database.dart';

class MarkupPraceListTable extends SupabaseTable<MarkupPraceListRow> {
  @override
  String get tableName => 'markup_prace_list';

  @override
  MarkupPraceListRow createRow(Map<String, dynamic> data) =>
      MarkupPraceListRow(data);
}

class MarkupPraceListRow extends SupabaseDataRow {
  MarkupPraceListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarkupPraceListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get procent => getField<int>('procent');
  set procent(int? value) => setField<int>('procent', value);

  bool? get defaultField => getField<bool>('default');
  set defaultField(bool? value) => setField<bool>('default', value);
}
