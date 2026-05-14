import '../database.dart';

class UserWarehouseTable extends SupabaseTable<UserWarehouseRow> {
  @override
  String get tableName => 'user_warehouse';

  @override
  UserWarehouseRow createRow(Map<String, dynamic> data) =>
      UserWarehouseRow(data);
}

class UserWarehouseRow extends SupabaseDataRow {
  UserWarehouseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserWarehouseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  int? get warehouse => getField<int>('warehouse');
  set warehouse(int? value) => setField<int>('warehouse', value);
}
