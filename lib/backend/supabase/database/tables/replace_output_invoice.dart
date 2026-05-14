import '../database.dart';

class ReplaceOutputInvoiceTable extends SupabaseTable<ReplaceOutputInvoiceRow> {
  @override
  String get tableName => 'replace_output_invoice';

  @override
  ReplaceOutputInvoiceRow createRow(Map<String, dynamic> data) =>
      ReplaceOutputInvoiceRow(data);
}

class ReplaceOutputInvoiceRow extends SupabaseDataRow {
  ReplaceOutputInvoiceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReplaceOutputInvoiceTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get replace => getField<bool>('replace');
  set replace(bool? value) => setField<bool>('replace', value);

  int? get wallet => getField<int>('wallet');
  set wallet(int? value) => setField<int>('wallet', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get typePyament => getField<String>('type_pyament');
  set typePyament(String? value) => setField<String>('type_pyament', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  bool? get cancelled => getField<bool>('cancelled');
  set cancelled(bool? value) => setField<bool>('cancelled', value);

  String? get paymentInvoiceLink => getField<String>('payment_invoice_link');
  set paymentInvoiceLink(String? value) =>
      setField<String>('payment_invoice_link', value);

  bool? get paymentInvoiceStatus => getField<bool>('payment_invoice_status');
  set paymentInvoiceStatus(bool? value) =>
      setField<bool>('payment_invoice_status', value);
}
