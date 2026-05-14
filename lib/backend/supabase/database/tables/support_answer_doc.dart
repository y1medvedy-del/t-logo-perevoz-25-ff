import '../database.dart';

class SupportAnswerDocTable extends SupabaseTable<SupportAnswerDocRow> {
  @override
  String get tableName => 'support_answer_doc';

  @override
  SupportAnswerDocRow createRow(Map<String, dynamic> data) =>
      SupportAnswerDocRow(data);
}

class SupportAnswerDocRow extends SupabaseDataRow {
  SupportAnswerDocRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportAnswerDocTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bloc => getField<int>('bloc');
  set bloc(int? value) => setField<int>('bloc', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  bool? get image => getField<bool>('image');
  set image(bool? value) => setField<bool>('image', value);

  bool? get video => getField<bool>('video');
  set video(bool? value) => setField<bool>('video', value);

  bool? get doc => getField<bool>('doc');
  set doc(bool? value) => setField<bool>('doc', value);

  String? get nameDoc => getField<String>('name_doc');
  set nameDoc(String? value) => setField<String>('name_doc', value);
}
