import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get userIdAuthorization => getField<String>('user_id_authorization');
  set userIdAuthorization(String? value) =>
      setField<String>('user_id_authorization', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get patronymic => getField<String>('patronymic');
  set patronymic(String? value) => setField<String>('patronymic', value);

  bool? get ownerCompany => getField<bool>('owner_company');
  set ownerCompany(bool? value) => setField<bool>('owner_company', value);

  String? get typeUser => getField<String>('type_user');
  set typeUser(String? value) => setField<String>('type_user', value);

  bool? get contract => getField<bool>('contract');
  set contract(bool? value) => setField<bool>('contract', value);

  bool? get blockingUser => getField<bool>('blocking user');
  set blockingUser(bool? value) => setField<bool>('blocking user', value);

  String? get referral => getField<String>('referral');
  set referral(String? value) => setField<String>('referral', value);

  String? get position => getField<String>('position');
  set position(String? value) => setField<String>('position', value);

  int? get idCompany => getField<int>('id company');
  set idCompany(int? value) => setField<int>('id company', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get phoneUser => getField<String>('phone_user');
  set phoneUser(String? value) => setField<String>('phone_user', value);

  String? get exitTime => getField<String>('exit time');
  set exitTime(String? value) => setField<String>('exit time', value);

  bool? get fillingProfile => getField<bool>('filling_profile');
  set fillingProfile(bool? value) => setField<bool>('filling_profile', value);

  String? get nameCompany => getField<String>('name company');
  set nameCompany(String? value) => setField<String>('name company', value);

  bool? get ban => getField<bool>('BAN');
  set ban(bool? value) => setField<bool>('BAN', value);

  bool? get superAdmin => getField<bool>('super_admin');
  set superAdmin(bool? value) => setField<bool>('super_admin', value);

  bool? get confirmationOwner => getField<bool>('confirmation_owner');
  set confirmationOwner(bool? value) =>
      setField<bool>('confirmation_owner', value);

  String? get statusJob => getField<String>('status_job');
  set statusJob(String? value) => setField<String>('status_job', value);

  bool? get fizLico => getField<bool>('fiz_lico');
  set fizLico(bool? value) => setField<bool>('fiz_lico', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get pushyToken => getField<String>('pushy_token');
  set pushyToken(String? value) => setField<String>('pushy_token', value);

  String? get pusheTokenWeb => getField<String>('pushe_token_web');
  set pusheTokenWeb(String? value) =>
      setField<String>('pushe_token_web', value);
}
