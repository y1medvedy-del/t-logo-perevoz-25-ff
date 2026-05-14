import '../database.dart';

class TopicsSupportTable extends SupabaseTable<TopicsSupportRow> {
  @override
  String get tableName => 'topics_support';

  @override
  TopicsSupportRow createRow(Map<String, dynamic> data) =>
      TopicsSupportRow(data);
}

class TopicsSupportRow extends SupabaseDataRow {
  TopicsSupportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TopicsSupportTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  bool? get warehouse => getField<bool>('warehouse');
  set warehouse(bool? value) => setField<bool>('warehouse', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);
}
