import '../database.dart';

class NdsTable extends SupabaseTable<NdsRow> {
  @override
  String get tableName => 'nds';

  @override
  NdsRow createRow(Map<String, dynamic> data) => NdsRow(data);
}

class NdsRow extends SupabaseDataRow {
  NdsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NdsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get procent => getField<int>('procent');
  set procent(int? value) => setField<int>('procent', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
