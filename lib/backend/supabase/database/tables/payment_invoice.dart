import '../database.dart';

class PaymentInvoiceTable extends SupabaseTable<PaymentInvoiceRow> {
  @override
  String get tableName => 'payment_invoice';

  @override
  PaymentInvoiceRow createRow(Map<String, dynamic> data) =>
      PaymentInvoiceRow(data);
}

class PaymentInvoiceRow extends SupabaseDataRow {
  PaymentInvoiceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentInvoiceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int? get creator => getField<int>('creator');
  set creator(int? value) => setField<int>('creator', value);

  int? get recipient => getField<int>('recipient');
  set recipient(int? value) => setField<int>('recipient', value);

  int? get application => getField<int>('application');
  set application(int? value) => setField<int>('application', value);

  int? get replaceOutput => getField<int>('replace_output');
  set replaceOutput(int? value) => setField<int>('replace_output', value);

  int? get fine => getField<int>('fine');
  set fine(int? value) => setField<int>('fine', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  bool? get forCarrier => getField<bool>('for_carrier');
  set forCarrier(bool? value) => setField<bool>('for_carrier', value);

  bool? get forWarehouse => getField<bool>('for_warehouse');
  set forWarehouse(bool? value) => setField<bool>('for_warehouse', value);

  bool? get forAdmin => getField<bool>('for_admin');
  set forAdmin(bool? value) => setField<bool>('for_admin', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get titleStatus => getField<String>('title_status');
  set titleStatus(String? value) => setField<String>('title_status', value);

  String? get logTransaction => getField<String>('log_transaction');
  set logTransaction(String? value) =>
      setField<String>('log_transaction', value);

  int? get nds => getField<int>('nds');
  set nds(int? value) => setField<int>('nds', value);

  int? get number => getField<int>('number');
  set number(int? value) => setField<int>('number', value);

  int? get companyCreator => getField<int>('company_creator');
  set companyCreator(int? value) => setField<int>('company_creator', value);

  bool? get upload => getField<bool>('upload');
  set upload(bool? value) => setField<bool>('upload', value);

  int? get companyBayer => getField<int>('company_bayer');
  set companyBayer(int? value) => setField<int>('company_bayer', value);

  int? get commission => getField<int>('commission');
  set commission(int? value) => setField<int>('commission', value);

  int? get markupCompany => getField<int>('markupCompany');
  set markupCompany(int? value) => setField<int>('markupCompany', value);
}
