import '../database.dart';

class ApplicationWalletViewTable
    extends SupabaseTable<ApplicationWalletViewRow> {
  @override
  String get tableName => 'application_wallet_view';

  @override
  ApplicationWalletViewRow createRow(Map<String, dynamic> data) =>
      ApplicationWalletViewRow(data);
}

class ApplicationWalletViewRow extends SupabaseDataRow {
  ApplicationWalletViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ApplicationWalletViewTable();

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  DateTime? get applicationCreatedAt =>
      getField<DateTime>('application_created_at');
  set applicationCreatedAt(DateTime? value) =>
      setField<DateTime>('application_created_at', value);

  int? get applicationCreator => getField<int>('application_creator');
  set applicationCreator(int? value) =>
      setField<int>('application_creator', value);

  String? get applicationAdresStreetCreator =>
      getField<String>('application_adres_street_creator');
  set applicationAdresStreetCreator(String? value) =>
      setField<String>('application_adres_street_creator', value);

  String? get applicationAdressHouseCreator =>
      getField<String>('application_adress_house_creator');
  set applicationAdressHouseCreator(String? value) =>
      setField<String>('application_adress_house_creator', value);

  String? get applicationTypeCargo =>
      getField<String>('application_type_cargo');
  set applicationTypeCargo(String? value) =>
      setField<String>('application_type_cargo', value);

  String? get applicationDesiretDate =>
      getField<String>('application_desiret_date');
  set applicationDesiretDate(String? value) =>
      setField<String>('application_desiret_date', value);

  String? get applicationDesiretTime =>
      getField<String>('application_desiret_time');
  set applicationDesiretTime(String? value) =>
      setField<String>('application_desiret_time', value);

  String? get applicationDescription =>
      getField<String>('application_description');
  set applicationDescription(String? value) =>
      setField<String>('application_description', value);

  int? get applicationIdCar => getField<int>('application_id_car');
  set applicationIdCar(int? value) =>
      setField<int>('application_id_car', value);

  String? get applicationPaymentType =>
      getField<String>('application_payment_type');
  set applicationPaymentType(String? value) =>
      setField<String>('application_payment_type', value);

  String? get applicationJobStatus =>
      getField<String>('application_job_status');
  set applicationJobStatus(String? value) =>
      setField<String>('application_job_status', value);

  String? get applicationPaymentStatus =>
      getField<String>('application_payment_status');
  set applicationPaymentStatus(String? value) =>
      setField<String>('application_payment_status', value);

  String? get applicationNamber => getField<String>('application_namber');
  set applicationNamber(String? value) =>
      setField<String>('application_namber', value);

  int? get applicationExecutor => getField<int>('application_executor');
  set applicationExecutor(int? value) =>
      setField<int>('application_executor', value);

  int? get applicationCityId => getField<int>('application_city_id');
  set applicationCityId(int? value) =>
      setField<int>('application_city_id', value);

  List<int> get applicationFavourites =>
      getListField<int>('application_favourites');
  set applicationFavourites(List<int>? value) =>
      setListField<int>('application_favourites', value);

  int? get applicationPrice => getField<int>('application_price');
  set applicationPrice(int? value) => setField<int>('application_price', value);

  int? get applicationAnswer => getField<int>('application_answer');
  set applicationAnswer(int? value) =>
      setField<int>('application_answer', value);

  int? get applicationChatid => getField<int>('application_chatid');
  set applicationChatid(int? value) =>
      setField<int>('application_chatid', value);

  DateTime? get applicationPaymentDate =>
      getField<DateTime>('application_payment_date');
  set applicationPaymentDate(DateTime? value) =>
      setField<DateTime>('application_payment_date', value);

  double? get applicationAmount => getField<double>('application_amount');
  set applicationAmount(double? value) =>
      setField<double>('application_amount', value);

  bool? get applicationIsWorkAccepted =>
      getField<bool>('application_is_work_accepted');
  set applicationIsWorkAccepted(bool? value) =>
      setField<bool>('application_is_work_accepted', value);

  int? get applicationCompanyId => getField<int>('application_company_id');
  set applicationCompanyId(int? value) =>
      setField<int>('application_company_id', value);

  int? get applicationExecuterCompany =>
      getField<int>('application_executer_company');
  set applicationExecuterCompany(int? value) =>
      setField<int>('application_executer_company', value);

  int? get applicationAdminId => getField<int>('application_admin_id');
  set applicationAdminId(int? value) =>
      setField<int>('application_admin_id', value);

  int? get applicationAdminCompany =>
      getField<int>('application_admin_company');
  set applicationAdminCompany(int? value) =>
      setField<int>('application_admin_company', value);

  int? get applicationWalletAdmin => getField<int>('application_wallet_admin');
  set applicationWalletAdmin(int? value) =>
      setField<int>('application_wallet_admin', value);

  int? get idDriver => getField<int>('id_driver');
  set idDriver(int? value) => setField<int>('id_driver', value);

  int? get walletCompanyId => getField<int>('wallet_company_id');
  set walletCompanyId(int? value) => setField<int>('wallet_company_id', value);

  double? get walletCompanyCurrentBalance =>
      getField<double>('wallet_company_current_balance');
  set walletCompanyCurrentBalance(double? value) =>
      setField<double>('wallet_company_current_balance', value);

  double? get walletCompanyFrozenBalance =>
      getField<double>('wallet_company_frozen_balance');
  set walletCompanyFrozenBalance(double? value) =>
      setField<double>('wallet_company_frozen_balance', value);

  double? get walletCompanyMinBalance =>
      getField<double>('wallet_company_min_balance');
  set walletCompanyMinBalance(double? value) =>
      setField<double>('wallet_company_min_balance', value);

  bool? get walletCompanyIsActive => getField<bool>('wallet_company_is_active');
  set walletCompanyIsActive(bool? value) =>
      setField<bool>('wallet_company_is_active', value);

  int? get walletExecuterId => getField<int>('wallet_executer_id');
  set walletExecuterId(int? value) =>
      setField<int>('wallet_executer_id', value);

  double? get walletExecuterCurrentBalance =>
      getField<double>('wallet_executer_current_balance');
  set walletExecuterCurrentBalance(double? value) =>
      setField<double>('wallet_executer_current_balance', value);

  double? get walletExecuterFrozenBalance =>
      getField<double>('wallet_executer_frozen_balance');
  set walletExecuterFrozenBalance(double? value) =>
      setField<double>('wallet_executer_frozen_balance', value);

  double? get walletExecuterMinBalance =>
      getField<double>('wallet_executer_min_balance');
  set walletExecuterMinBalance(double? value) =>
      setField<double>('wallet_executer_min_balance', value);

  bool? get walletExecuterIsActive =>
      getField<bool>('wallet_executer_is_active');
  set walletExecuterIsActive(bool? value) =>
      setField<bool>('wallet_executer_is_active', value);

  int? get walletAdminId => getField<int>('wallet_admin_id');
  set walletAdminId(int? value) => setField<int>('wallet_admin_id', value);

  double? get walletAdminCompanyCurrentBalance =>
      getField<double>('wallet_admin_company_current_balance');
  set walletAdminCompanyCurrentBalance(double? value) =>
      setField<double>('wallet_admin_company_current_balance', value);

  double? get walletAdminCompanyFrozenBalance =>
      getField<double>('wallet_admin_company_frozen_balance');
  set walletAdminCompanyFrozenBalance(double? value) =>
      setField<double>('wallet_admin_company_frozen_balance', value);

  double? get walletAdminCompanyMinBalance =>
      getField<double>('wallet_admin_company_min_balance');
  set walletAdminCompanyMinBalance(double? value) =>
      setField<double>('wallet_admin_company_min_balance', value);

  bool? get walletAdminCompanyIsActive =>
      getField<bool>('wallet_admin_company_is_active');
  set walletAdminCompanyIsActive(bool? value) =>
      setField<bool>('wallet_admin_company_is_active', value);
}
