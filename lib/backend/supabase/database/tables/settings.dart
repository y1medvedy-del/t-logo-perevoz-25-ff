import '../database.dart';

class SettingsTable extends SupabaseTable<SettingsRow> {
  @override
  String get tableName => 'settings';

  @override
  SettingsRow createRow(Map<String, dynamic> data) => SettingsRow(data);
}

class SettingsRow extends SupabaseDataRow {
  SettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SettingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get adminWalletId => getField<int>('admin_wallet_id');
  set adminWalletId(int? value) => setField<int>('admin_wallet_id', value);

  int? get superAdminUserId => getField<int>('super_admin_user_id');
  set superAdminUserId(int? value) =>
      setField<int>('super_admin_user_id', value);

  String? get adminSecretCode => getField<String>('admin_secret_code');
  set adminSecretCode(String? value) =>
      setField<String>('admin_secret_code', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get adminCompanyId => getField<int>('admin_company_id');
  set adminCompanyId(int? value) => setField<int>('admin_company_id', value);

  int? get currentAdminUserId => getField<int>('current_admin_user_id');
  set currentAdminUserId(int? value) =>
      setField<int>('current_admin_user_id', value);

  String? get textPayCard => getField<String>('text_pay_card');
  set textPayCard(String? value) => setField<String>('text_pay_card', value);

  String? get textCancelCarrier => getField<String>('text_cancel_carrier');
  set textCancelCarrier(String? value) =>
      setField<String>('text_cancel_carrier', value);

  String? get textCancelHouse => getField<String>('text_cancel_house');
  set textCancelHouse(String? value) =>
      setField<String>('text_cancel_house', value);

  int? get dayLimitCreateApplication =>
      getField<int>('day_limit_create_application');
  set dayLimitCreateApplication(int? value) =>
      setField<int>('day_limit_create_application', value);

  int? get cancelChatDay => getField<int>('cancel_chat_day');
  set cancelChatDay(int? value) => setField<int>('cancel_chat_day', value);

  bool? get flag => getField<bool>('flag');
  set flag(bool? value) => setField<bool>('flag', value);

  int? get amountFine => getField<int>('amount_fine');
  set amountFine(int? value) => setField<int>('amount_fine', value);

  int? get commissionCardPercent => getField<int>('commission_card_percent');
  set commissionCardPercent(int? value) =>
      setField<int>('commission_card_percent', value);

  int? get daysToHideContacts => getField<int>('days_to_hide_contacts');
  set daysToHideContacts(int? value) =>
      setField<int>('days_to_hide_contacts', value);

  bool? get hideBannersCarrier => getField<bool>('hide_banners_carrier');
  set hideBannersCarrier(bool? value) =>
      setField<bool>('hide_banners_carrier', value);

  bool? get hideBannersWarehouse => getField<bool>('hide_banners_warehouse');
  set hideBannersWarehouse(bool? value) =>
      setField<bool>('hide_banners_warehouse', value);

  int? get completionToArchiveDays =>
      getField<int>('completion_to _archive_days');
  set completionToArchiveDays(int? value) =>
      setField<int>('completion_to _archive_days', value);

  int? get commissionApplication => getField<int>('commission_application');
  set commissionApplication(int? value) =>
      setField<int>('commission_application', value);

  String? get textPayScore => getField<String>('text_pay_score');
  set textPayScore(String? value) => setField<String>('text_pay_score', value);

  int? get commissionForTheWarehouse =>
      getField<int>('commission_for_the_warehouse');
  set commissionForTheWarehouse(int? value) =>
      setField<int>('commission_for_the_warehouse', value);
}
