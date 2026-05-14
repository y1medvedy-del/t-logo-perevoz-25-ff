import '../database.dart';

class ChatTable extends SupabaseTable<ChatRow> {
  @override
  String get tableName => 'chat';

  @override
  ChatRow createRow(Map<String, dynamic> data) => ChatRow(data);
}

class ChatRow extends SupabaseDataRow {
  ChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userCarrier => getField<int>('user carrier');
  set userCarrier(int? value) => setField<int>('user carrier', value);

  int? get userWareHouse => getField<int>('user ware house');
  set userWareHouse(int? value) => setField<int>('user ware house', value);

  int? get application => getField<int>('application');
  set application(int? value) => setField<int>('application', value);

  DateTime? get lastMessageDate => getField<DateTime>('last message date');
  set lastMessageDate(DateTime? value) =>
      setField<DateTime>('last message date', value);

  PostgresTime? get lastMessageTime =>
      getField<PostgresTime>('last message time');
  set lastMessageTime(PostgresTime? value) =>
      setField<PostgresTime>('last message time', value);

  String? get lastMessage => getField<String>('last message');
  set lastMessage(String? value) => setField<String>('last message', value);

  bool? get chatAdmin => getField<bool>('chat_admin');
  set chatAdmin(bool? value) => setField<bool>('chat_admin', value);

  int? get recipientAdmin => getField<int>('recipient_admin');
  set recipientAdmin(int? value) => setField<int>('recipient_admin', value);

  DateTime? get lastMessageDayAndTime =>
      getField<DateTime>('last_message_day_and_time');
  set lastMessageDayAndTime(DateTime? value) =>
      setField<DateTime>('last_message_day_and_time', value);
}
