import '../database.dart';

class WorksTable extends SupabaseTable<WorksRow> {
  @override
  String get tableName => 'works';

  @override
  WorksRow createRow(Map<String, dynamic> data) => WorksRow(data);
}

class WorksRow extends SupabaseDataRow {
  WorksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameWork => getField<String>('name_work');
  set nameWork(String? value) => setField<String>('name_work', value);

  String? get uniteSize => getField<String>('unite size');
  set uniteSize(String? value) => setField<String>('unite size', value);

  int? get sortIndex => getField<int>('sort_index');
  set sortIndex(int? value) => setField<int>('sort_index', value);
}
