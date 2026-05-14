import '../database.dart';

class ApplicationPaymentProfitTable
    extends SupabaseTable<ApplicationPaymentProfitRow> {
  @override
  String get tableName => 'application_payment_profit';

  @override
  ApplicationPaymentProfitRow createRow(Map<String, dynamic> data) =>
      ApplicationPaymentProfitRow(data);
}

class ApplicationPaymentProfitRow extends SupabaseDataRow {
  ApplicationPaymentProfitRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApplicationPaymentProfitTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get applicationId => getField<int>('application_id')!;
  set applicationId(int value) => setField<int>('application_id', value);

  int get onlinePaymentId => getField<int>('online_payment_id')!;
  set onlinePaymentId(int value) => setField<int>('online_payment_id', value);

  double get baseAmount => getField<double>('base_amount')!;
  set baseAmount(double value) => setField<double>('base_amount', value);

  double get markupPercent => getField<double>('markup_percent')!;
  set markupPercent(double value) => setField<double>('markup_percent', value);

  double get markupAmount => getField<double>('markup_amount')!;
  set markupAmount(double value) => setField<double>('markup_amount', value);

  double get bankCommissionPercent =>
      getField<double>('bank_commission_percent')!;
  set bankCommissionPercent(double value) =>
      setField<double>('bank_commission_percent', value);

  double get bankCommissionAmount =>
      getField<double>('bank_commission_amount')!;
  set bankCommissionAmount(double value) =>
      setField<double>('bank_commission_amount', value);

  double get warehouseCommissionPercent =>
      getField<double>('warehouse_commission_percent')!;
  set warehouseCommissionPercent(double value) =>
      setField<double>('warehouse_commission_percent', value);

  double get warehouseCommissionAmount =>
      getField<double>('warehouse_commission_amount')!;
  set warehouseCommissionAmount(double value) =>
      setField<double>('warehouse_commission_amount', value);

  double get warehouseAmount => getField<double>('warehouse_amount')!;
  set warehouseAmount(double value) =>
      setField<double>('warehouse_amount', value);

  double get clientBaseAmount => getField<double>('client_base_amount')!;
  set clientBaseAmount(double value) =>
      setField<double>('client_base_amount', value);

  double get clientTotalAmount => getField<double>('client_total_amount')!;
  set clientTotalAmount(double value) =>
      setField<double>('client_total_amount', value);

  double get systemProfitAmount => getField<double>('system_profit_amount')!;
  set systemProfitAmount(double value) =>
      setField<double>('system_profit_amount', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
