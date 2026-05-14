import '../database.dart';

class ComplaintTable extends SupabaseTable<ComplaintRow> {
  @override
  String get tableName => 'complaint';

  @override
  ComplaintRow createRow(Map<String, dynamic> data) => ComplaintRow(data);
}

class ComplaintRow extends SupabaseDataRow {
  ComplaintRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ComplaintTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  bool? get read => getField<bool>('read');
  set read(bool? value) => setField<bool>('read', value);

  List<String> get photoList => getListField<String>('photo list');
  set photoList(List<String>? value) =>
      setListField<String>('photo list', value);

  List<String> get videoList => getListField<String>('video list');
  set videoList(List<String>? value) =>
      setListField<String>('video list', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  String? get replyMessage => getField<String>('reply_message');
  set replyMessage(String? value) => setField<String>('reply_message', value);

  DateTime? get replyMessageDate => getField<DateTime>('reply_message_date');
  set replyMessageDate(DateTime? value) =>
      setField<DateTime>('reply_message_date', value);
}
