import '../database.dart';

class SmsLogsTable extends SupabaseTable<SmsLogsRow> {
  @override
  String get tableName => 'sms_logs';

  @override
  SmsLogsRow createRow(Map<String, dynamic> data) => SmsLogsRow(data);
}

class SmsLogsRow extends SupabaseDataRow {
  SmsLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SmsLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get otp => getField<String>('otp');
  set otp(String? value) => setField<String>('otp', value);

  int? get statusCode => getField<int>('status_code');
  set statusCode(int? value) => setField<int>('status_code', value);

  dynamic get response => getField<dynamic>('response');
  set response(dynamic value) => setField<dynamic>('response', value);
}
