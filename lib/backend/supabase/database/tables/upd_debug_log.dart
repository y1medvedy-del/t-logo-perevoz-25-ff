import '../database.dart';

class UpdDebugLogTable extends SupabaseTable<UpdDebugLogRow> {
  @override
  String get tableName => 'upd_debug_log';

  @override
  UpdDebugLogRow createRow(Map<String, dynamic> data) => UpdDebugLogRow(data);
}

class UpdDebugLogRow extends SupabaseDataRow {
  UpdDebugLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UpdDebugLogTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  int? get sellerCompanyId => getField<int>('seller_company_id');
  set sellerCompanyId(int? value) => setField<int>('seller_company_id', value);

  int? get buyerCompanyId => getField<int>('buyer_company_id');
  set buyerCompanyId(int? value) => setField<int>('buyer_company_id', value);

  String get requestUrl => getField<String>('request_url')!;
  set requestUrl(String value) => setField<String>('request_url', value);

  dynamic get requestPayload => getField<dynamic>('request_payload')!;
  set requestPayload(dynamic value) =>
      setField<dynamic>('request_payload', value);

  int? get httpStatus => getField<int>('http_status');
  set httpStatus(int? value) => setField<int>('http_status', value);

  String? get responseBody => getField<String>('response_body');
  set responseBody(String? value) => setField<String>('response_body', value);

  String get errorMessage => getField<String>('error_message')!;
  set errorMessage(String value) => setField<String>('error_message', value);
}
