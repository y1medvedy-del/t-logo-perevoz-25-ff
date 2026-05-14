import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get estimation => getField<int>('estimation');
  set estimation(int? value) => setField<int>('estimation', value);

  int? get application => getField<int>('application');
  set application(int? value) => setField<int>('application', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get sender => getField<int>('sender');
  set sender(int? value) => setField<int>('sender', value);

  int? get recipient => getField<int>('recipient');
  set recipient(int? value) => setField<int>('recipient', value);

  int? get answer => getField<int>('answer');
  set answer(int? value) => setField<int>('answer', value);

  DateTime? get timeAnswer => getField<DateTime>('time answer');
  set timeAnswer(DateTime? value) => setField<DateTime>('time answer', value);

  bool? get read => getField<bool>('read');
  set read(bool? value) => setField<bool>('read', value);

  String? get textAnswer => getField<String>('text_answer');
  set textAnswer(String? value) => setField<String>('text_answer', value);
}
