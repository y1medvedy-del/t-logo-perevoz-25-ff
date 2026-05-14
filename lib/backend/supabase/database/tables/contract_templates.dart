import '../database.dart';

class ContractTemplatesTable extends SupabaseTable<ContractTemplatesRow> {
  @override
  String get tableName => 'contract_templates';

  @override
  ContractTemplatesRow createRow(Map<String, dynamic> data) =>
      ContractTemplatesRow(data);
}

class ContractTemplatesRow extends SupabaseDataRow {
  ContractTemplatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContractTemplatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  dynamic get varsFixedKeys => getField<dynamic>('vars_fixed_keys');
  set varsFixedKeys(dynamic value) =>
      setField<dynamic>('vars_fixed_keys', value);

  dynamic get varsCustomKeys => getField<dynamic>('vars_custom_keys');
  set varsCustomKeys(dynamic value) =>
      setField<dynamic>('vars_custom_keys', value);
}
