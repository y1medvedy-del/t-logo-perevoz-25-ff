import '../database.dart';

class OnlinePaymentsTable extends SupabaseTable<OnlinePaymentsRow> {
  @override
  String get tableName => 'online_payments';

  @override
  OnlinePaymentsRow createRow(Map<String, dynamic> data) =>
      OnlinePaymentsRow(data);
}

class OnlinePaymentsRow extends SupabaseDataRow {
  OnlinePaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OnlinePaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String get provider => getField<String>('provider')!;
  set provider(String value) => setField<String>('provider', value);

  String get purpose => getField<String>('purpose')!;
  set purpose(String value) => setField<String>('purpose', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get walletId => getField<int>('wallet_id');
  set walletId(int? value) => setField<int>('wallet_id', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String get currency => getField<String>('currency')!;
  set currency(String value) => setField<String>('currency', value);

  String get orderId => getField<String>('order_id')!;
  set orderId(String value) => setField<String>('order_id', value);

  String? get bankPaymentId => getField<String>('bank_payment_id');
  set bankPaymentId(String? value) =>
      setField<String>('bank_payment_id', value);

  String? get paymentUrl => getField<String>('payment_url');
  set paymentUrl(String? value) => setField<String>('payment_url', value);

  String? get successUrl => getField<String>('success_url');
  set successUrl(String? value) => setField<String>('success_url', value);

  String? get failUrl => getField<String>('fail_url');
  set failUrl(String? value) => setField<String>('fail_url', value);

  String? get notificationUrl => getField<String>('notification_url');
  set notificationUrl(String? value) =>
      setField<String>('notification_url', value);

  dynamic get rawInitResponse => getField<dynamic>('raw_init_response');
  set rawInitResponse(dynamic value) =>
      setField<dynamic>('raw_init_response', value);

  dynamic get rawStatusResponse => getField<dynamic>('raw_status_response');
  set rawStatusResponse(dynamic value) =>
      setField<dynamic>('raw_status_response', value);

  dynamic get rawNotification => getField<dynamic>('raw_notification');
  set rawNotification(dynamic value) =>
      setField<dynamic>('raw_notification', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);

  DateTime? get appliedAt => getField<DateTime>('applied_at');
  set appliedAt(DateTime? value) => setField<DateTime>('applied_at', value);

  String? get targetType => getField<String>('target_type');
  set targetType(String? value) => setField<String>('target_type', value);

  int? get targetId => getField<int>('target_id');
  set targetId(int? value) => setField<int>('target_id', value);

  String? get bankStatus => getField<String>('bank_status');
  set bankStatus(String? value) => setField<String>('bank_status', value);

  String? get providerStatus => getField<String>('provider_status');
  set providerStatus(String? value) =>
      setField<String>('provider_status', value);

  dynamic get appliedResult => getField<dynamic>('applied_result');
  set appliedResult(dynamic value) =>
      setField<dynamic>('applied_result', value);

  String? get receiptEmail => getField<String>('receipt_email');
  set receiptEmail(String? value) => setField<String>('receipt_email', value);

  String? get receiptPhone => getField<String>('receipt_phone');
  set receiptPhone(String? value) => setField<String>('receipt_phone', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);

  dynamic get rawWebhookPayload => getField<dynamic>('raw_webhook_payload');
  set rawWebhookPayload(dynamic value) =>
      setField<dynamic>('raw_webhook_payload', value);

  bool get isApplied => getField<bool>('is_applied')!;
  set isApplied(bool value) => setField<bool>('is_applied', value);
}
