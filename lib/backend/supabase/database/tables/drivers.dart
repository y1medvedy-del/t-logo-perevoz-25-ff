import '../database.dart';

class DriversTable extends SupabaseTable<DriversRow> {
  @override
  String get tableName => 'drivers';

  @override
  DriversRow createRow(Map<String, dynamic> data) => DriversRow(data);
}

class DriversRow extends SupabaseDataRow {
  DriversRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriversTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get patronymic => getField<String>('patronymic');
  set patronymic(String? value) => setField<String>('patronymic', value);
}
