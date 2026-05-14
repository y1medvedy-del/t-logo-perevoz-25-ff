import '../database.dart';

class TransactionsTable extends SupabaseTable<TransactionsRow> {
  @override
  String get tableName => 'transactions';

  @override
  TransactionsRow createRow(Map<String, dynamic> data) => TransactionsRow(data);
}

class TransactionsRow extends SupabaseDataRow {
  TransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get walletId => getField<int>('wallet_id')!;
  set walletId(int value) => setField<int>('wallet_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String get transactionType => getField<String>('transaction_type')!;
  set transactionType(String value) =>
      setField<String>('transaction_type', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  bool get isFrozen => getField<bool>('is_frozen')!;
  set isFrozen(bool value) => setField<bool>('is_frozen', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  bool? get paymentConfirmationRequired =>
      getField<bool>('payment_confirmation_required');
  set paymentConfirmationRequired(bool? value) =>
      setField<bool>('payment_confirmation_required', value);

  int? get userPaymentConfirmed => getField<int>('user_payment_confirmed');
  set userPaymentConfirmed(int? value) =>
      setField<int>('user_payment_confirmed', value);

  int? get walletAdmin => getField<int>('wallet_admin');
  set walletAdmin(int? value) => setField<int>('wallet_admin', value);

  int? get executerId => getField<int>('executer_id');
  set executerId(int? value) => setField<int>('executer_id', value);

  int? get replaceOutput => getField<int>('replace_output');
  set replaceOutput(int? value) => setField<int>('replace_output', value);

  int? get finePayment => getField<int>('fine_payment');
  set finePayment(int? value) => setField<int>('fine_payment', value);

  bool? get paymentApplication => getField<bool>('payment_application');
  set paymentApplication(bool? value) =>
      setField<bool>('payment_application', value);
}
