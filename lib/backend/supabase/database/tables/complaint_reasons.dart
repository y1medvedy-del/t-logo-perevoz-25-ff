import '../database.dart';

class ComplaintReasonsTable extends SupabaseTable<ComplaintReasonsRow> {
  @override
  String get tableName => 'complaint_reasons';

  @override
  ComplaintReasonsRow createRow(Map<String, dynamic> data) =>
      ComplaintReasonsRow(data);
}

class ComplaintReasonsRow extends SupabaseDataRow {
  ComplaintReasonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ComplaintReasonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);
}
