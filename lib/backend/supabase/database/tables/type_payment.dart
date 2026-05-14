import '../database.dart';

class TypePaymentTable extends SupabaseTable<TypePaymentRow> {
  @override
  String get tableName => 'type_payment';

  @override
  TypePaymentRow createRow(Map<String, dynamic> data) => TypePaymentRow(data);
}

class TypePaymentRow extends SupabaseDataRow {
  TypePaymentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TypePaymentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get visible => getField<bool>('visible');
  set visible(bool? value) => setField<bool>('visible', value);
}
