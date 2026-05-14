import '../database.dart';

class PremiumSubscriptionTable extends SupabaseTable<PremiumSubscriptionRow> {
  @override
  String get tableName => 'premium_subscription';

  @override
  PremiumSubscriptionRow createRow(Map<String, dynamic> data) =>
      PremiumSubscriptionRow(data);
}

class PremiumSubscriptionRow extends SupabaseDataRow {
  PremiumSubscriptionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PremiumSubscriptionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  bool? get works => getField<bool>('works');
  set works(bool? value) => setField<bool>('works', value);
}
