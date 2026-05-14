import '../database.dart';

class DocumentContractCompanyNameTable
    extends SupabaseTable<DocumentContractCompanyNameRow> {
  @override
  String get tableName => 'document_contract_company_name';

  @override
  DocumentContractCompanyNameRow createRow(Map<String, dynamic> data) =>
      DocumentContractCompanyNameRow(data);
}

class DocumentContractCompanyNameRow extends SupabaseDataRow {
  DocumentContractCompanyNameRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentContractCompanyNameTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  int? get contractDataId => getField<int>('contract_data_id');
  set contractDataId(int? value) => setField<int>('contract_data_id', value);

  String? get templateId => getField<String>('template_id');
  set templateId(String? value) => setField<String>('template_id', value);

  int? get version => getField<int>('version');
  set version(int? value) => setField<int>('version', value);

  bool? get signatureClient => getField<bool>('signature_client');
  set signatureClient(bool? value) => setField<bool>('signature_client', value);

  bool? get forCarrier => getField<bool>('for_carrier');
  set forCarrier(bool? value) => setField<bool>('for_carrier', value);

  bool? get forWarehouse => getField<bool>('for_warehouse');
  set forWarehouse(bool? value) => setField<bool>('for_warehouse', value);

  int? get idCustomerCompany => getField<int>('id_customer_company');
  set idCustomerCompany(int? value) =>
      setField<int>('id_customer_company', value);

  int? get idExecuterCompany => getField<int>('id_executer_company');
  set idExecuterCompany(int? value) =>
      setField<int>('id_executer_company', value);

  bool? get confirmed => getField<bool>('confirmed');
  set confirmed(bool? value) => setField<bool>('confirmed', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get customerCompanyName => getField<String>('customer_company_name');
  set customerCompanyName(String? value) =>
      setField<String>('customer_company_name', value);

  String? get executerCompanyName => getField<String>('executer_company_name');
  set executerCompanyName(String? value) =>
      setField<String>('executer_company_name', value);
}
