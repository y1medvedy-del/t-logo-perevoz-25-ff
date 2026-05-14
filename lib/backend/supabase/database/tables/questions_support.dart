import '../database.dart';

class QuestionsSupportTable extends SupabaseTable<QuestionsSupportRow> {
  @override
  String get tableName => 'questions_support';

  @override
  QuestionsSupportRow createRow(Map<String, dynamic> data) =>
      QuestionsSupportRow(data);
}

class QuestionsSupportRow extends SupabaseDataRow {
  QuestionsSupportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionsSupportTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get topic => getField<int>('topic');
  set topic(int? value) => setField<int>('topic', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  bool? get warehouse => getField<bool>('warehouse');
  set warehouse(bool? value) => setField<bool>('warehouse', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);
}
