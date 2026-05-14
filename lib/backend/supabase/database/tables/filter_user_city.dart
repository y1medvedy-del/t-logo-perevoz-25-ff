import '../database.dart';

class FilterUserCityTable extends SupabaseTable<FilterUserCityRow> {
  @override
  String get tableName => 'filter_user_city';

  @override
  FilterUserCityRow createRow(Map<String, dynamic> data) =>
      FilterUserCityRow(data);
}

class FilterUserCityRow extends SupabaseDataRow {
  FilterUserCityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FilterUserCityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  int? get cityFilter => getField<int>('city_filter');
  set cityFilter(int? value) => setField<int>('city_filter', value);
}
