import '../database.dart';

class ApplicationWithUsersTable extends SupabaseTable<ApplicationWithUsersRow> {
  @override
  String get tableName => 'application_with_users';

  @override
  ApplicationWithUsersRow createRow(Map<String, dynamic> data) =>
      ApplicationWithUsersRow(data);
}

class ApplicationWithUsersRow extends SupabaseDataRow {
  ApplicationWithUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApplicationWithUsersTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get creator => getField<int>('creator');
  set creator(int? value) => setField<int>('creator', value);

  String? get creatorAvatar => getField<String>('creator_avatar');
  set creatorAvatar(String? value) => setField<String>('creator_avatar', value);

  String? get creatorName => getField<String>('creator_name');
  set creatorName(String? value) => setField<String>('creator_name', value);

  String? get creatorSurname => getField<String>('creator_surname');
  set creatorSurname(String? value) =>
      setField<String>('creator_surname', value);

  String? get creatorPatronymic => getField<String>('creator_patronymic');
  set creatorPatronymic(String? value) =>
      setField<String>('creator_patronymic', value);

  String? get adresStreetCreator => getField<String>('adres_street_creator');
  set adresStreetCreator(String? value) =>
      setField<String>('adres_street_creator', value);

  String? get adressHouseCreator => getField<String>('adress_house_creator');
  set adressHouseCreator(String? value) =>
      setField<String>('adress_house_creator', value);

  String? get typeCargo => getField<String>('type_cargo');
  set typeCargo(String? value) => setField<String>('type_cargo', value);

  String? get desiretDate => getField<String>('desiret_date');
  set desiretDate(String? value) => setField<String>('desiret_date', value);

  String? get desiretTime => getField<String>('desiret_time');
  set desiretTime(String? value) => setField<String>('desiret_time', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get idCar => getField<int>('id_car');
  set idCar(int? value) => setField<int>('id_car', value);

  String? get paymentType => getField<String>('payment_type');
  set paymentType(String? value) => setField<String>('payment_type', value);

  String? get jobStatus => getField<String>('job_status');
  set jobStatus(String? value) => setField<String>('job_status', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get namber => getField<String>('namber');
  set namber(String? value) => setField<String>('namber', value);

  int? get executor => getField<int>('executor');
  set executor(int? value) => setField<int>('executor', value);

  String? get executorAvatar => getField<String>('executor_avatar');
  set executorAvatar(String? value) =>
      setField<String>('executor_avatar', value);

  String? get executorName => getField<String>('executor_name');
  set executorName(String? value) => setField<String>('executor_name', value);

  String? get executorSurname => getField<String>('executor_surname');
  set executorSurname(String? value) =>
      setField<String>('executor_surname', value);

  String? get executorPatronymic => getField<String>('executor_patronymic');
  set executorPatronymic(String? value) =>
      setField<String>('executor_patronymic', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  List<int> get favourites => getListField<int>('favourites');
  set favourites(List<int>? value) => setListField<int>('favourites', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get answer => getField<int>('answer');
  set answer(int? value) => setField<int>('answer', value);

  int? get chatID => getField<int>('chatID');
  set chatID(int? value) => setField<int>('chatID', value);

  DateTime? get paymentDate => getField<DateTime>('payment_date');
  set paymentDate(DateTime? value) => setField<DateTime>('payment_date', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  bool? get isWorkAccepted => getField<bool>('is_work_accepted');
  set isWorkAccepted(bool? value) => setField<bool>('is_work_accepted', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get executerCompany => getField<int>('executer_company');
  set executerCompany(int? value) => setField<int>('executer_company', value);

  int? get adminId => getField<int>('admin_id');
  set adminId(int? value) => setField<int>('admin_id', value);

  int? get adminCompany => getField<int>('admin_company');
  set adminCompany(int? value) => setField<int>('admin_company', value);

  int? get walletAdmin => getField<int>('wallet_admin');
  set walletAdmin(int? value) => setField<int>('wallet_admin', value);

  bool? get revise => getField<bool>('revise');
  set revise(bool? value) => setField<bool>('revise', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lon => getField<double>('lon');
  set lon(double? value) => setField<double>('lon', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get numberCar => getField<String>('number_car');
  set numberCar(String? value) => setField<String>('number_car', value);

  int? get idDriver => getField<int>('id_driver');
  set idDriver(int? value) => setField<int>('id_driver', value);
}
