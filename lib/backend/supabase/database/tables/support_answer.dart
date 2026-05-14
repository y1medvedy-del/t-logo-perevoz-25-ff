import '../database.dart';

class SupportAnswerTable extends SupabaseTable<SupportAnswerRow> {
  @override
  String get tableName => 'support_answer';

  @override
  SupportAnswerRow createRow(Map<String, dynamic> data) =>
      SupportAnswerRow(data);
}

class SupportAnswerRow extends SupabaseDataRow {
  SupportAnswerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportAnswerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get question => getField<int>('question');
  set question(int? value) => setField<int>('question', value);
}
