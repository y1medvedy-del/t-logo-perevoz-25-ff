import '../database.dart';

class FeedBackUserTable extends SupabaseTable<FeedBackUserRow> {
  @override
  String get tableName => 'feed_back_user';

  @override
  FeedBackUserRow createRow(Map<String, dynamic> data) => FeedBackUserRow(data);
}

class FeedBackUserRow extends SupabaseDataRow {
  FeedBackUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedBackUserTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  String? get senderAvatar => getField<String>('sender_avatar');
  set senderAvatar(String? value) => setField<String>('sender_avatar', value);

  String? get senderName => getField<String>('sender_name');
  set senderName(String? value) => setField<String>('sender_name', value);

  String? get senderSurname => getField<String>('sender_surname');
  set senderSurname(String? value) => setField<String>('sender_surname', value);

  String? get senderPatronymic => getField<String>('sender_patronymic');
  set senderPatronymic(String? value) =>
      setField<String>('sender_patronymic', value);

  String? get senderNameCompany => getField<String>('sender_name_company');
  set senderNameCompany(String? value) =>
      setField<String>('sender_name_company', value);

  String? get senderTypeUser => getField<String>('sender_type_user');
  set senderTypeUser(String? value) =>
      setField<String>('sender_type_user', value);

  bool? get senderBan => getField<bool>('sender_ban');
  set senderBan(bool? value) => setField<bool>('sender_ban', value);

  String? get viewerAvatar => getField<String>('viewer_avatar');
  set viewerAvatar(String? value) => setField<String>('viewer_avatar', value);

  String? get viewerName => getField<String>('viewer_name');
  set viewerName(String? value) => setField<String>('viewer_name', value);

  String? get viewerSurname => getField<String>('viewer_surname');
  set viewerSurname(String? value) => setField<String>('viewer_surname', value);

  String? get viewerPatronymic => getField<String>('viewer_patronymic');
  set viewerPatronymic(String? value) =>
      setField<String>('viewer_patronymic', value);

  String? get viewerNameCompany => getField<String>('viewer_name_company');
  set viewerNameCompany(String? value) =>
      setField<String>('viewer_name_company', value);

  String? get viewerTypeUser => getField<String>('viewer_type_user');
  set viewerTypeUser(String? value) =>
      setField<String>('viewer_type_user', value);

  bool? get viewerBan => getField<bool>('viewer_ban');
  set viewerBan(bool? value) => setField<bool>('viewer_ban', value);
}
