import '../database.dart';

class ApplicationDetailsTable extends SupabaseTable<ApplicationDetailsRow> {
  @override
  String get tableName => 'application_details';

  @override
  ApplicationDetailsRow createRow(Map<String, dynamic> data) =>
      ApplicationDetailsRow(data);
}

class ApplicationDetailsRow extends SupabaseDataRow {
  ApplicationDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApplicationDetailsTable();

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  DateTime? get applicationDate => getField<DateTime>('application_date');
  set applicationDate(DateTime? value) =>
      setField<DateTime>('application_date', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get streetAddress => getField<String>('street_address');
  set streetAddress(String? value) => setField<String>('street_address', value);

  String? get houseAddress => getField<String>('house_address');
  set houseAddress(String? value) => setField<String>('house_address', value);

  String? get cargoType => getField<String>('cargo_type');
  set cargoType(String? value) => setField<String>('cargo_type', value);

  String? get desiredDate => getField<String>('desired_date');
  set desiredDate(String? value) => setField<String>('desired_date', value);

  String? get desiredTime => getField<String>('desired_time');
  set desiredTime(String? value) => setField<String>('desired_time', value);

  String? get applicationDescription =>
      getField<String>('application_description');
  set applicationDescription(String? value) =>
      setField<String>('application_description', value);

  int? get carId => getField<int>('car_id');
  set carId(int? value) => setField<int>('car_id', value);

  String? get paymentType => getField<String>('payment_type');
  set paymentType(String? value) => setField<String>('payment_type', value);

  String? get jobStatus => getField<String>('job_status');
  set jobStatus(String? value) => setField<String>('job_status', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  int? get applicationAnswer => getField<int>('application_answer');
  set applicationAnswer(int? value) =>
      setField<int>('application_answer', value);

  String? get applicationNumber => getField<String>('application_number');
  set applicationNumber(String? value) =>
      setField<String>('application_number', value);

  int? get executorId => getField<int>('executor_id');
  set executorId(int? value) => setField<int>('executor_id', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  int? get chatId => getField<int>('chat_id');
  set chatId(int? value) => setField<int>('chat_id', value);

  int? get applicationPrice => getField<int>('application_price');
  set applicationPrice(int? value) => setField<int>('application_price', value);

  List<int> get listIdUserAnswer => getListField<int>('list_id_user_answer');
  set listIdUserAnswer(List<int>? value) =>
      setListField<int>('list_id_user_answer', value);

  int? get idDriver => getField<int>('id_driver');
  set idDriver(int? value) => setField<int>('id_driver', value);

  bool? get isWorkAccepted => getField<bool>('is_work_accepted');
  set isWorkAccepted(bool? value) => setField<bool>('is_work_accepted', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get userAvatar => getField<String>('user_avatar');
  set userAvatar(String? value) => setField<String>('user_avatar', value);

  String? get userIdAuthorization => getField<String>('user_id_authorization');
  set userIdAuthorization(String? value) =>
      setField<String>('user_id_authorization', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPatronymic => getField<String>('user_patronymic');
  set userPatronymic(String? value) =>
      setField<String>('user_patronymic', value);

  bool? get userOwnerCompany => getField<bool>('user_owner_company');
  set userOwnerCompany(bool? value) =>
      setField<bool>('user_owner_company', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);

  bool? get userContract => getField<bool>('user_contract');
  set userContract(bool? value) => setField<bool>('user_contract', value);

  bool? get userBlocking => getField<bool>('user_blocking');
  set userBlocking(bool? value) => setField<bool>('user_blocking', value);

  String? get userReferral => getField<String>('user_referral');
  set userReferral(String? value) => setField<String>('user_referral', value);

  String? get userPosition => getField<String>('user_position');
  set userPosition(String? value) => setField<String>('user_position', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get userDisplayName => getField<String>('user_display_name');
  set userDisplayName(String? value) =>
      setField<String>('user_display_name', value);

  String? get userPhone => getField<String>('user_phone');
  set userPhone(String? value) => setField<String>('user_phone', value);

  String? get userExitTime => getField<String>('user_exit_time');
  set userExitTime(String? value) => setField<String>('user_exit_time', value);

  bool? get userFillingProfile => getField<bool>('user_filling_profile');
  set userFillingProfile(bool? value) =>
      setField<bool>('user_filling_profile', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  bool? get userBan => getField<bool>('user_ban');
  set userBan(bool? value) => setField<bool>('user_ban', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);

  String? get cityLatlong => getField<String>('city_latlong');
  set cityLatlong(String? value) => setField<String>('city_latlong', value);

  bool? get cityWorker => getField<bool>('city_worker');
  set cityWorker(bool? value) => setField<bool>('city_worker', value);

  String? get cityAbbreviature => getField<String>('city_abbreviature');
  set cityAbbreviature(String? value) =>
      setField<String>('city_abbreviature', value);
}
