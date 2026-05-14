import '../database.dart';

class WalletsTable extends SupabaseTable<WalletsRow> {
  @override
  String get tableName => 'wallets';

  @override
  WalletsRow createRow(Map<String, dynamic> data) => WalletsRow(data);
}

class WalletsRow extends SupabaseDataRow {
  WalletsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WalletsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get companyId => getField<int>('company_id')!;
  set companyId(int value) => setField<int>('company_id', value);

  double get currentBalance => getField<double>('current_balance')!;
  set currentBalance(double value) =>
      setField<double>('current_balance', value);

  double get frozenBalance => getField<double>('frozen_balance')!;
  set frozenBalance(double value) => setField<double>('frozen_balance', value);

  double? get minBalance => getField<double>('min_balance');
  set minBalance(double? value) => setField<double>('min_balance', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get emailCompany => getField<String>('email_company');
  set emailCompany(String? value) => setField<String>('email_company', value);
}
