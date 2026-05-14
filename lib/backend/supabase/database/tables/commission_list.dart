import '../database.dart';

class CommissionListTable extends SupabaseTable<CommissionListRow> {
  @override
  String get tableName => 'commission_list';

  @override
  CommissionListRow createRow(Map<String, dynamic> data) =>
      CommissionListRow(data);
}

class CommissionListRow extends SupabaseDataRow {
  CommissionListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommissionListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get procent => getField<int>('procent');
  set procent(int? value) => setField<int>('procent', value);

  bool? get defaultField => getField<bool>('default');
  set defaultField(bool? value) => setField<bool>('default', value);
}
