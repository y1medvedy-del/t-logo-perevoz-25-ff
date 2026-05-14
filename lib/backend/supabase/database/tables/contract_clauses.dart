import '../database.dart';

class ContractClausesTable extends SupabaseTable<ContractClausesRow> {
  @override
  String get tableName => 'contract_clauses';

  @override
  ContractClausesRow createRow(Map<String, dynamic> data) =>
      ContractClausesRow(data);
}

class ContractClausesRow extends SupabaseDataRow {
  ContractClausesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContractClausesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get templateId => getField<int>('template_id');
  set templateId(int? value) => setField<int>('template_id', value);

  int get sortOrder => getField<int>('sort_order')!;
  set sortOrder(int value) => setField<int>('sort_order', value);

  String get text => getField<String>('text')!;
  set text(String value) => setField<String>('text', value);

  bool get enabled => getField<bool>('enabled')!;
  set enabled(bool value) => setField<bool>('enabled', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int get fontSize => getField<int>('font_size')!;
  set fontSize(int value) => setField<int>('font_size', value);

  int get textAlign => getField<int>('text_align')!;
  set textAlign(int value) => setField<int>('text_align', value);

  int get styleCode => getField<int>('style_code')!;
  set styleCode(int value) => setField<int>('style_code', value);

  int? get idDocumentContract => getField<int>('id_document_contract');
  set idDocumentContract(int? value) =>
      setField<int>('id_document_contract', value);
}
