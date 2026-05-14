import '../database.dart';

class AnswerContentTable extends SupabaseTable<AnswerContentRow> {
  @override
  String get tableName => 'answer_content';

  @override
  AnswerContentRow createRow(Map<String, dynamic> data) =>
      AnswerContentRow(data);
}

class AnswerContentRow extends SupabaseDataRow {
  AnswerContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnswerContentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idApplication => getField<int>('id_application');
  set idApplication(int? value) => setField<int>('id_application', value);

  int? get idAnswer => getField<int>('id_answer');
  set idAnswer(int? value) => setField<int>('id_answer', value);

  bool? get photo => getField<bool>('photo');
  set photo(bool? value) => setField<bool>('photo', value);

  bool? get video => getField<bool>('video');
  set video(bool? value) => setField<bool>('video', value);

  String? get referenceFile => getField<String>('reference_file');
  set referenceFile(String? value) => setField<String>('reference_file', value);

  bool? get doc => getField<bool>('doc');
  set doc(bool? value) => setField<bool>('doc', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get paymentInvoice => getField<bool>('payment_invoice');
  set paymentInvoice(bool? value) => setField<bool>('payment_invoice', value);

  bool? get createdAdmin => getField<bool>('created_admin');
  set createdAdmin(bool? value) => setField<bool>('created_admin', value);
}
