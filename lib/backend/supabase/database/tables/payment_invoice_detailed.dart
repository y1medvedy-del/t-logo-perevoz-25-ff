import '../database.dart';

class PaymentInvoiceDetailedTable
    extends SupabaseTable<PaymentInvoiceDetailedRow> {
  @override
  String get tableName => 'payment_invoice_detailed';

  @override
  PaymentInvoiceDetailedRow createRow(Map<String, dynamic> data) =>
      PaymentInvoiceDetailedRow(data);
}

class PaymentInvoiceDetailedRow extends SupabaseDataRow {
  PaymentInvoiceDetailedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentInvoiceDetailedTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int? get application => getField<int>('application');
  set application(int? value) => setField<int>('application', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  bool? get forCarrier => getField<bool>('for_carrier');
  set forCarrier(bool? value) => setField<bool>('for_carrier', value);

  bool? get forWarehouse => getField<bool>('for_warehouse');
  set forWarehouse(bool? value) => setField<bool>('for_warehouse', value);

  bool? get forAdmin => getField<bool>('for_admin');
  set forAdmin(bool? value) => setField<bool>('for_admin', value);

  int? get replaceOutput => getField<int>('replace_output');
  set replaceOutput(int? value) => setField<int>('replace_output', value);

  int? get fine => getField<int>('fine');
  set fine(int? value) => setField<int>('fine', value);

  int? get creator => getField<int>('creator');
  set creator(int? value) => setField<int>('creator', value);

  String? get creatorName => getField<String>('creator_name');
  set creatorName(String? value) => setField<String>('creator_name', value);

  String? get creatorSurname => getField<String>('creator_surname');
  set creatorSurname(String? value) =>
      setField<String>('creator_surname', value);

  String? get creatorPatronymic => getField<String>('creator_patronymic');
  set creatorPatronymic(String? value) =>
      setField<String>('creator_patronymic', value);

  String? get creatorCompany => getField<String>('creator_company');
  set creatorCompany(String? value) =>
      setField<String>('creator_company', value);

  int? get recipient => getField<int>('recipient');
  set recipient(int? value) => setField<int>('recipient', value);

  String? get recipientName => getField<String>('recipient_name');
  set recipientName(String? value) => setField<String>('recipient_name', value);

  String? get recipientSurname => getField<String>('recipient_surname');
  set recipientSurname(String? value) =>
      setField<String>('recipient_surname', value);

  String? get recipientPatronymic => getField<String>('recipient_patronymic');
  set recipientPatronymic(String? value) =>
      setField<String>('recipient_patronymic', value);

  String? get recipientCompany => getField<String>('recipient_company');
  set recipientCompany(String? value) =>
      setField<String>('recipient_company', value);

  String? get applicationCity => getField<String>('application_city');
  set applicationCity(String? value) =>
      setField<String>('application_city', value);

  String? get applicationNamber => getField<String>('application_namber');
  set applicationNamber(String? value) =>
      setField<String>('application_namber', value);
}
