import '../database.dart';

class ComplaintUserTable extends SupabaseTable<ComplaintUserRow> {
  @override
  String get tableName => 'complaint_user';

  @override
  ComplaintUserRow createRow(Map<String, dynamic> data) =>
      ComplaintUserRow(data);
}

class ComplaintUserRow extends SupabaseDataRow {
  ComplaintUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ComplaintUserTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get patronymic => getField<String>('patronymic');
  set patronymic(String? value) => setField<String>('patronymic', value);

  String? get typeUser => getField<String>('type_user');
  set typeUser(String? value) => setField<String>('type_user', value);

  String? get position => getField<String>('position');
  set position(String? value) => setField<String>('position', value);

  int? get idCompany => getField<int>('id company');
  set idCompany(int? value) => setField<int>('id company', value);

  String? get nameCompany => getField<String>('name company');
  set nameCompany(String? value) => setField<String>('name company', value);

  bool? get ban => getField<bool>('BAN');
  set ban(bool? value) => setField<bool>('BAN', value);

  String? get applicationNumber => getField<String>('application_number');
  set applicationNumber(String? value) =>
      setField<String>('application_number', value);
}
