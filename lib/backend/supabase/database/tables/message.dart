import '../database.dart';

class MessageTable extends SupabaseTable<MessageRow> {
  @override
  String get tableName => 'message';

  @override
  MessageRow createRow(Map<String, dynamic> data) => MessageRow(data);
}

class MessageRow extends SupabaseDataRow {
  MessageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get chatId => getField<int>('chat_id');
  set chatId(int? value) => setField<int>('chat_id', value);

  int? get sender => getField<int>('sender');
  set sender(int? value) => setField<int>('sender', value);

  int? get recipient => getField<int>('recipient');
  set recipient(int? value) => setField<int>('recipient', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get docMessage => getField<String>('docMessage');
  set docMessage(String? value) => setField<String>('docMessage', value);

  String? get photoMessage => getField<String>('photo Message');
  set photoMessage(String? value) => setField<String>('photo Message', value);

  String? get videoMessage => getField<String>('video_message');
  set videoMessage(String? value) => setField<String>('video_message', value);

  bool? get viewed => getField<bool>('viewed');
  set viewed(bool? value) => setField<bool>('viewed', value);
}
