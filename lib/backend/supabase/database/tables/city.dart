import '../database.dart';

class CityTable extends SupabaseTable<CityRow> {
  @override
  String get tableName => 'city';

  @override
  CityRow createRow(Map<String, dynamic> data) => CityRow(data);
}

class CityRow extends SupabaseDataRow {
  CityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get latLong => getField<String>('latLong');
  set latLong(String? value) => setField<String>('latLong', value);

  bool? get worker => getField<bool>('worker');
  set worker(bool? value) => setField<bool>('worker', value);

  String? get abbreviature => getField<String>('abbreviature');
  set abbreviature(String? value) => setField<String>('abbreviature', value);

  bool? get flag => getField<bool>('flag');
  set flag(bool? value) => setField<bool>('flag', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);
}
