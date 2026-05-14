import '../database.dart';

class WorksApplicationTable extends SupabaseTable<WorksApplicationRow> {
  @override
  String get tableName => 'works_application';

  @override
  WorksApplicationRow createRow(Map<String, dynamic> data) =>
      WorksApplicationRow(data);
}

class WorksApplicationRow extends SupabaseDataRow {
  WorksApplicationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorksApplicationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idApplication => getField<int>('idApplication');
  set idApplication(int? value) => setField<int>('idApplication', value);

  int? get idAnswer => getField<int>('idAnswer');
  set idAnswer(int? value) => setField<int>('idAnswer', value);

  String? get nameService => getField<String>('nameService');
  set nameService(String? value) => setField<String>('nameService', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  String? get uniteSize => getField<String>('uniteSize');
  set uniteSize(String? value) => setField<String>('uniteSize', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get newQuantity => getField<int>('new quantity');
  set newQuantity(int? value) => setField<int>('new quantity', value);

  int? get newPrice => getField<int>('newPrice');
  set newPrice(int? value) => setField<int>('newPrice', value);

  String? get typeGruz => getField<String>('typeGruz');
  set typeGruz(String? value) => setField<String>('typeGruz', value);
}
