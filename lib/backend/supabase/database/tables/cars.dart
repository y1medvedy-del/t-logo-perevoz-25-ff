import '../database.dart';

class CarsTable extends SupabaseTable<CarsRow> {
  @override
  String get tableName => 'cars';

  @override
  CarsRow createRow(Map<String, dynamic> data) => CarsRow(data);
}

class CarsRow extends SupabaseDataRow {
  CarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
