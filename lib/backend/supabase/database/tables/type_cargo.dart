import '../database.dart';

class TypeCargoTable extends SupabaseTable<TypeCargoRow> {
  @override
  String get tableName => 'type_cargo';

  @override
  TypeCargoRow createRow(Map<String, dynamic> data) => TypeCargoRow(data);
}

class TypeCargoRow extends SupabaseDataRow {
  TypeCargoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TypeCargoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameCargo => getField<String>('nameCargo');
  set nameCargo(String? value) => setField<String>('nameCargo', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);
}
