import '../database.dart';

class ChatWithUserAndApplicationInfoTable
    extends SupabaseTable<ChatWithUserAndApplicationInfoRow> {
  @override
  String get tableName => 'chat_with_user_and_application_info';

  @override
  ChatWithUserAndApplicationInfoRow createRow(Map<String, dynamic> data) =>
      ChatWithUserAndApplicationInfoRow(data);
}

class ChatWithUserAndApplicationInfoRow extends SupabaseDataRow {
  ChatWithUserAndApplicationInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatWithUserAndApplicationInfoTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  DateTime? get lastMessageDayAndTime =>
      getField<DateTime>('last_message_day_and_time');
  set lastMessageDayAndTime(DateTime? value) =>
      setField<DateTime>('last_message_day_and_time', value);

  String? get lastMessage => getField<String>('last message');
  set lastMessage(String? value) => setField<String>('last message', value);

  bool? get chatAdmin => getField<bool>('chat_admin');
  set chatAdmin(bool? value) => setField<bool>('chat_admin', value);

  int? get carrierUserId => getField<int>('carrier_user_id');
  set carrierUserId(int? value) => setField<int>('carrier_user_id', value);

  String? get carrierUserName => getField<String>('carrier_user_name');
  set carrierUserName(String? value) =>
      setField<String>('carrier_user_name', value);

  String? get carrierUserSurname => getField<String>('carrier_user_surname');
  set carrierUserSurname(String? value) =>
      setField<String>('carrier_user_surname', value);

  String? get carrierUserAvatar => getField<String>('carrier_user_avatar');
  set carrierUserAvatar(String? value) =>
      setField<String>('carrier_user_avatar', value);

  int? get warehouseUserId => getField<int>('warehouse_user_id');
  set warehouseUserId(int? value) => setField<int>('warehouse_user_id', value);

  String? get warehouseUserName => getField<String>('warehouse_user_name');
  set warehouseUserName(String? value) =>
      setField<String>('warehouse_user_name', value);

  String? get warehouseUserSurname =>
      getField<String>('warehouse_user_surname');
  set warehouseUserSurname(String? value) =>
      setField<String>('warehouse_user_surname', value);

  String? get warehouseUserAvatar => getField<String>('warehouse_user_avatar');
  set warehouseUserAvatar(String? value) =>
      setField<String>('warehouse_user_avatar', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  String? get applicationNamber => getField<String>('application_namber');
  set applicationNamber(String? value) =>
      setField<String>('application_namber', value);

  DateTime? get applicationPaymentDate =>
      getField<DateTime>('application_payment_date');
  set applicationPaymentDate(DateTime? value) =>
      setField<DateTime>('application_payment_date', value);
}
