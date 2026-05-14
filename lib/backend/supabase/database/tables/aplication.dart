import '../database.dart';

class AplicationTable extends SupabaseTable<AplicationRow> {
  @override
  String get tableName => 'aplication';

  @override
  AplicationRow createRow(Map<String, dynamic> data) => AplicationRow(data);
}

class AplicationRow extends SupabaseDataRow {
  AplicationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AplicationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get creator => getField<int>('creator');
  set creator(int? value) => setField<int>('creator', value);

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

  String? get jobStatus => getField<String>('job status');
  set jobStatus(String? value) => setField<String>('job status', value);

  String? get paymentStatus => getField<String>('payment status');
  set paymentStatus(String? value) => setField<String>('payment status', value);

  String? get namber => getField<String>('namber');
  set namber(String? value) => setField<String>('namber', value);

  int? get executor => getField<int>('executor');
  set executor(int? value) => setField<int>('executor', value);

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

  List<int> get listIdUserAnswer => getListField<int>('list_id_user_answer');
  set listIdUserAnswer(List<int>? value) =>
      setListField<int>('list_id_user_answer', value);

  int? get idDriver => getField<int>('id_driver');
  set idDriver(int? value) => setField<int>('id_driver', value);

  int? get answerUserSelect => getField<int>('answer_user_select');
  set answerUserSelect(int? value) =>
      setField<int>('answer_user_select', value);

  String? get descriptionStatus => getField<String>('description_status');
  set descriptionStatus(String? value) =>
      setField<String>('description_status', value);

  String? get nameCar => getField<String>('name_car');
  set nameCar(String? value) => setField<String>('name_car', value);

  String? get phoneDriver => getField<String>('phone_driver');
  set phoneDriver(String? value) => setField<String>('phone_driver', value);

  String? get surnameDriver => getField<String>('surname_driver');
  set surnameDriver(String? value) => setField<String>('surname_driver', value);

  String? get nameDriver => getField<String>('name_driver');
  set nameDriver(String? value) => setField<String>('name_driver', value);

  String? get patronymicDriver => getField<String>('patronymic_driver');
  set patronymicDriver(String? value) =>
      setField<String>('patronymic_driver', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);

  DateTime? get completionTime => getField<DateTime>('completion_time');
  set completionTime(DateTime? value) =>
      setField<DateTime>('completion_time', value);

  int? get markup => getField<int>('markup');
  set markup(int? value) => setField<int>('markup', value);
}
