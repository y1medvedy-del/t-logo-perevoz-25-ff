import '../database.dart';

class ClientContractDataTable extends SupabaseTable<ClientContractDataRow> {
  @override
  String get tableName => 'client_contract_data';

  @override
  ClientContractDataRow createRow(Map<String, dynamic> data) =>
      ClientContractDataRow(data);
}

class ClientContractDataRow extends SupabaseDataRow {
  ClientContractDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientContractDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get companyId => getField<int>('company_id')!;
  set companyId(int value) => setField<int>('company_id', value);

  String get templateId => getField<String>('template_id')!;
  set templateId(String value) => setField<String>('template_id', value);

  int get version => getField<int>('version')!;
  set version(int value) => setField<int>('version', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime? get validFrom => getField<DateTime>('valid_from');
  set validFrom(DateTime? value) => setField<DateTime>('valid_from', value);

  DateTime? get validTo => getField<DateTime>('valid_to');
  set validTo(DateTime? value) => setField<DateTime>('valid_to', value);

  int? get customerCompanyId => getField<int>('customer_company_id');
  set customerCompanyId(int? value) =>
      setField<int>('customer_company_id', value);

  int get executorCompanyId => getField<int>('executor_company_id')!;
  set executorCompanyId(int value) =>
      setField<int>('executor_company_id', value);

  dynamic get varsFixed => getField<dynamic>('vars_fixed')!;
  set varsFixed(dynamic value) => setField<dynamic>('vars_fixed', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  dynamic get varsCustom => getField<dynamic>('vars_custom')!;
  set varsCustom(dynamic value) => setField<dynamic>('vars_custom', value);

  int? get idDocumentContract => getField<int>('id_document_contract');
  set idDocumentContract(int? value) =>
      setField<int>('id_document_contract', value);
}
