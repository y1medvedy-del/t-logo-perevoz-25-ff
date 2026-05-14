import '../database.dart';

class FineApplicationUserViewTable
    extends SupabaseTable<FineApplicationUserViewRow> {
  @override
  String get tableName => 'fine_application_user_view';

  @override
  FineApplicationUserViewRow createRow(Map<String, dynamic> data) =>
      FineApplicationUserViewRow(data);
}

class FineApplicationUserViewRow extends SupabaseDataRow {
  FineApplicationUserViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FineApplicationUserViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get valid => getField<bool>('valid');
  set valid(bool? value) => setField<bool>('valid', value);

  String? get typePayment => getField<String>('type_payment');
  set typePayment(String? value) => setField<String>('type_payment', value);

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

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get statusPayment => getField<String>('status_payment');
  set statusPayment(String? value) => setField<String>('status_payment', value);

  String? get applicationCity => getField<String>('application_city');
  set applicationCity(String? value) =>
      setField<String>('application_city', value);

  String? get applicationNumber => getField<String>('application_number');
  set applicationNumber(String? value) =>
      setField<String>('application_number', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPatronymic => getField<String>('user_patronymic');
  set userPatronymic(String? value) =>
      setField<String>('user_patronymic', value);

  String? get userCompanyName => getField<String>('user_company_name');
  set userCompanyName(String? value) =>
      setField<String>('user_company_name', value);

  String? get typeUser => getField<String>('type_user');
  set typeUser(String? value) => setField<String>('type_user', value);
}
