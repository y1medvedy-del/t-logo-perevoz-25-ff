import '../database.dart';

class PositionsTable extends SupabaseTable<PositionsRow> {
  @override
  String get tableName => 'positions';

  @override
  PositionsRow createRow(Map<String, dynamic> data) => PositionsRow(data);
}

class PositionsRow extends SupabaseDataRow {
  PositionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PositionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get flag => getField<bool>('flag');
  set flag(bool? value) => setField<bool>('flag', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);
}
