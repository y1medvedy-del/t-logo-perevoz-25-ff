import '../database.dart';

class FineTable extends SupabaseTable<FineRow> {
  @override
  String get tableName => 'fine';

  @override
  FineRow createRow(Map<String, dynamic> data) => FineRow(data);
}

class FineRow extends SupabaseDataRow {
  FineRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FineTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get valid => getField<bool>('valid');
  set valid(bool? value) => setField<bool>('valid', value);

  String? get typePayment => getField<String>('type_payment');
  set typePayment(String? value) => setField<String>('type_payment', value);

  String? get docPayment => getField<String>('doc_payment');
  set docPayment(String? value) => setField<String>('doc_payment', value);

  DateTime? get datePayment => getField<DateTime>('date_payment');
  set datePayment(DateTime? value) => setField<DateTime>('date_payment', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get cityBloking => getField<String>('city_bloking');
  set cityBloking(String? value) => setField<String>('city_bloking', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
