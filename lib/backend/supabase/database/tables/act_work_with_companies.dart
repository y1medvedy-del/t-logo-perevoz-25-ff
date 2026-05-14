import '../database.dart';

class ActWorkWithCompaniesTable extends SupabaseTable<ActWorkWithCompaniesRow> {
  @override
  String get tableName => 'act_work_with_companies';

  @override
  ActWorkWithCompaniesRow createRow(Map<String, dynamic> data) =>
      ActWorkWithCompaniesRow(data);
}

class ActWorkWithCompaniesRow extends SupabaseDataRow {
  ActWorkWithCompaniesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActWorkWithCompaniesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get nameDoc => getField<String>('name_doc');
  set nameDoc(String? value) => setField<String>('name_doc', value);

  bool? get forCarrier => getField<bool>('for_carrier');
  set forCarrier(bool? value) => setField<bool>('for_carrier', value);

  bool? get forAdmin => getField<bool>('for_admin');
  set forAdmin(bool? value) => setField<bool>('for_admin', value);

  bool? get forWarehouse => getField<bool>('for_warehouse');
  set forWarehouse(bool? value) => setField<bool>('for_warehouse', value);

  int? get invoicePayment => getField<int>('invoice_payment');
  set invoicePayment(int? value) => setField<int>('invoice_payment', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  int? get fine => getField<int>('fine');
  set fine(int? value) => setField<int>('fine', value);

  String? get linkXls => getField<String>('link_xls');
  set linkXls(String? value) => setField<String>('link_xls', value);

  dynamic get jsonInfo => getField<dynamic>('json_info');
  set jsonInfo(dynamic value) => setField<dynamic>('json_info', value);

  int? get number => getField<int>('number');
  set number(int? value) => setField<int>('number', value);

  int? get companyCreator => getField<int>('company_creator');
  set companyCreator(int? value) => setField<int>('company_creator', value);

  String? get lincXml => getField<String>('linc_xml');
  set lincXml(String? value) => setField<String>('linc_xml', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  int? get companyCustomer => getField<int>('company_customer');
  set companyCustomer(int? value) => setField<int>('company_customer', value);

  String? get creatorCompanyName => getField<String>('creator_company_name');
  set creatorCompanyName(String? value) =>
      setField<String>('creator_company_name', value);

  String? get customerCompanyName => getField<String>('customer_company_name');
  set customerCompanyName(String? value) =>
      setField<String>('customer_company_name', value);
}
