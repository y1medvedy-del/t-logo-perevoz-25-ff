import '../database.dart';

class CityRequestTable extends SupabaseTable<CityRequestRow> {
  @override
  String get tableName => 'city_request';

  @override
  CityRequestRow createRow(Map<String, dynamic> data) => CityRequestRow(data);
}

class CityRequestRow extends SupabaseDataRow {
  CityRequestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CityRequestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  bool? get read => getField<bool>('read');
  set read(bool? value) => setField<bool>('read', value);
}
