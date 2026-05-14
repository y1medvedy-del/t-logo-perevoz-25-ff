import '../database.dart';

class CommissionForTheWarehouseTable
    extends SupabaseTable<CommissionForTheWarehouseRow> {
  @override
  String get tableName => 'commission_for_the_warehouse';

  @override
  CommissionForTheWarehouseRow createRow(Map<String, dynamic> data) =>
      CommissionForTheWarehouseRow(data);
}

class CommissionForTheWarehouseRow extends SupabaseDataRow {
  CommissionForTheWarehouseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommissionForTheWarehouseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get commission => getField<int>('commission');
  set commission(int? value) => setField<int>('commission', value);

  bool? get defaultField => getField<bool>('default');
  set defaultField(bool? value) => setField<bool>('default', value);
}
