import '../database.dart';

class WarehouseTable extends SupabaseTable<WarehouseRow> {
  @override
  String get tableName => 'warehouse';

  @override
  WarehouseRow createRow(Map<String, dynamic> data) => WarehouseRow(data);
}

class WarehouseRow extends SupabaseDataRow {
  WarehouseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WarehouseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  int? get creatorWarehouse => getField<int>('creator_warehouse');
  set creatorWarehouse(int? value) => setField<int>('creator_warehouse', value);

  int? get companyWarehouse => getField<int>('company_warehouse');
  set companyWarehouse(int? value) => setField<int>('company_warehouse', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get street => getField<String>('street');
  set street(String? value) => setField<String>('street', value);

  String? get house => getField<String>('house');
  set house(String? value) => setField<String>('house', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lon => getField<double>('lon');
  set lon(double? value) => setField<double>('lon', value);
}
