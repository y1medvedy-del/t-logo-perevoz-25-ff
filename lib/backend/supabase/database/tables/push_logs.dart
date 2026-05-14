import '../database.dart';

class PushLogsTable extends SupabaseTable<PushLogsRow> {
  @override
  String get tableName => 'push_logs';

  @override
  PushLogsRow createRow(Map<String, dynamic> data) => PushLogsRow(data);
}

class PushLogsRow extends SupabaseDataRow {
  PushLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PushLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  dynamic get roleFlags => getField<dynamic>('role_flags');
  set roleFlags(dynamic value) => setField<dynamic>('role_flags', value);

  bool? get success => getField<bool>('success');
  set success(bool? value) => setField<bool>('success', value);

  String? get fcmMessageId => getField<String>('fcm_message_id');
  set fcmMessageId(String? value) => setField<String>('fcm_message_id', value);

  String? get error => getField<String>('error');
  set error(String? value) => setField<String>('error', value);
}
