import '../database.dart';

class SupportAnswerTextTable extends SupabaseTable<SupportAnswerTextRow> {
  @override
  String get tableName => 'support_answer_text';

  @override
  SupportAnswerTextRow createRow(Map<String, dynamic> data) =>
      SupportAnswerTextRow(data);
}

class SupportAnswerTextRow extends SupabaseDataRow {
  SupportAnswerTextRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportAnswerTextTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get supportAnswer => getField<int>('support_answer');
  set supportAnswer(int? value) => setField<int>('support_answer', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  bool? get hyperlink => getField<bool>('hyperlink');
  set hyperlink(bool? value) => setField<bool>('hyperlink', value);
}
