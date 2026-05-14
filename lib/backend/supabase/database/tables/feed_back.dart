import '../database.dart';

class FeedBackTable extends SupabaseTable<FeedBackRow> {
  @override
  String get tableName => 'feed_back';

  @override
  FeedBackRow createRow(Map<String, dynamic> data) => FeedBackRow(data);
}

class FeedBackRow extends SupabaseDataRow {
  FeedBackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedBackTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get sender => getField<int>('sender');
  set sender(int? value) => setField<int>('sender', value);

  int? get estimation => getField<int>('estimation');
  set estimation(int? value) => setField<int>('estimation', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get viewed => getField<bool>('viewed');
  set viewed(bool? value) => setField<bool>('viewed', value);

  int? get viewedId => getField<int>('viewed_id');
  set viewedId(int? value) => setField<int>('viewed_id', value);
}
