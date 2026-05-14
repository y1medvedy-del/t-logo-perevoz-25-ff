import '../database.dart';

class TypeCompanyTable extends SupabaseTable<TypeCompanyRow> {
  @override
  String get tableName => 'type_company';

  @override
  TypeCompanyRow createRow(Map<String, dynamic> data) => TypeCompanyRow(data);
}

class TypeCompanyRow extends SupabaseDataRow {
  TypeCompanyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TypeCompanyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<String> get typeCompany => getListField<String>('type company');
  set typeCompany(List<String>? value) =>
      setListField<String>('type company', value);
}
