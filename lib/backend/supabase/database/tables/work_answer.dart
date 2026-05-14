import '../database.dart';

class WorkAnswerTable extends SupabaseTable<WorkAnswerRow> {
  @override
  String get tableName => 'work_answer';

  @override
  WorkAnswerRow createRow(Map<String, dynamic> data) => WorkAnswerRow(data);
}

class WorkAnswerRow extends SupabaseDataRow {
  WorkAnswerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkAnswerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameWork => getField<String>('name_work');
  set nameWork(String? value) => setField<String>('name_work', value);

  int? get answerId => getField<int>('answer_id');
  set answerId(int? value) => setField<int>('answer_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get newQuantity => getField<int>('new_quantity');
  set newQuantity(int? value) => setField<int>('new_quantity', value);

  int? get newPrice => getField<int>('new_price');
  set newPrice(int? value) => setField<int>('new_price', value);

  int? get createdUser => getField<int>('created_user');
  set createdUser(int? value) => setField<int>('created_user', value);

  bool? get newPositions => getField<bool>('new_positions');
  set newPositions(bool? value) => setField<bool>('new_positions', value);

  bool? get deletedEditing => getField<bool>('deleted_editing');
  set deletedEditing(bool? value) => setField<bool>('deleted_editing', value);
}
