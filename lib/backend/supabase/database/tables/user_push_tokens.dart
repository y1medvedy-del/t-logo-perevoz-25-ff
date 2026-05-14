import '../database.dart';

class UserPushTokensTable extends SupabaseTable<UserPushTokensRow> {
  @override
  String get tableName => 'user_push_tokens';

  @override
  UserPushTokensRow createRow(Map<String, dynamic> data) =>
      UserPushTokensRow(data);
}

class UserPushTokensRow extends SupabaseDataRow {
  UserPushTokensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPushTokensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  String? get platform => getField<String>('platform');
  set platform(String? value) => setField<String>('platform', value);

  String? get uuidUser => getField<String>('uuid_user');
  set uuidUser(String? value) => setField<String>('uuid_user', value);
}
