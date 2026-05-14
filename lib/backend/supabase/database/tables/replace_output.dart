import '../database.dart';

class ReplaceOutputTable extends SupabaseTable<ReplaceOutputRow> {
  @override
  String get tableName => 'replace_output';

  @override
  ReplaceOutputRow createRow(Map<String, dynamic> data) =>
      ReplaceOutputRow(data);
}

class ReplaceOutputRow extends SupabaseDataRow {
  ReplaceOutputRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReplaceOutputTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get replace => getField<bool>('replace');
  set replace(bool? value) => setField<bool>('replace', value);

  bool? get output => getField<bool>('output');
  set output(bool? value) => setField<bool>('output', value);

  int? get wallet => getField<int>('wallet');
  set wallet(int? value) => setField<int>('wallet', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  int? get transactionUser => getField<int>('transaction_user');
  set transactionUser(int? value) => setField<int>('transaction_user', value);

  int? get transactionAdmin => getField<int>('transaction_admin');
  set transactionAdmin(int? value) => setField<int>('transaction_admin', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get docPaymentAdmin => getField<String>('doc_payment_admin');
  set docPaymentAdmin(String? value) =>
      setField<String>('doc_payment_admin', value);

  String? get docPaymentUser => getField<String>('doc_payment_user');
  set docPaymentUser(String? value) =>
      setField<String>('doc_payment_user', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get typePyament => getField<String>('type_pyament');
  set typePyament(String? value) => setField<String>('type_pyament', value);

  int? get confirmationAdmin => getField<int>('confirmation_admin');
  set confirmationAdmin(int? value) =>
      setField<int>('confirmation_admin', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  bool? get cancelled => getField<bool>('cancelled');
  set cancelled(bool? value) => setField<bool>('cancelled', value);
}
