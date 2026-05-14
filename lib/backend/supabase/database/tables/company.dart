import '../database.dart';

class CompanyTable extends SupabaseTable<CompanyRow> {
  @override
  String get tableName => 'company';

  @override
  CompanyRow createRow(Map<String, dynamic> data) => CompanyRow(data);
}

class CompanyRow extends SupabaseDataRow {
  CompanyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userIdOwner => getField<int>('user_id_owner');
  set userIdOwner(int? value) => setField<int>('user_id_owner', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get pSerialNumber => getField<String>('P_serial_number');
  set pSerialNumber(String? value) =>
      setField<String>('P_serial_number', value);

  String? get pIssued => getField<String>('P_issued');
  set pIssued(String? value) => setField<String>('P_issued', value);

  String? get pDate => getField<String>('P_date');
  set pDate(String? value) => setField<String>('P_date', value);

  String? get pDivision => getField<String>('P_division');
  set pDivision(String? value) => setField<String>('P_division', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get ogrn => getField<String>('OGRN');
  set ogrn(String? value) => setField<String>('OGRN', value);

  String? get inn => getField<String>('INN');
  set inn(String? value) => setField<String>('INN', value);

  String? get kpp => getField<String>('KPP');
  set kpp(String? value) => setField<String>('KPP', value);

  String? get rUrAddress => getField<String>('R_ur_address');
  set rUrAddress(String? value) => setField<String>('R_ur_address', value);

  String? get rFactAddress => getField<String>('R_fact_address');
  set rFactAddress(String? value) => setField<String>('R_fact_address', value);

  String? get paymentAccount => getField<String>('payment_account');
  set paymentAccount(String? value) =>
      setField<String>('payment_account', value);

  String? get nnameBank => getField<String>('nname_bank');
  set nnameBank(String? value) => setField<String>('nname_bank', value);

  String? get bik => getField<String>('BIK');
  set bik(String? value) => setField<String>('BIK', value);

  String? get correspondentAccount => getField<String>('correspondent_account');
  set correspondentAccount(String? value) =>
      setField<String>('correspondent_account', value);

  bool get nds => getField<bool>('NDS')!;
  set nds(bool value) => setField<bool>('NDS', value);

  bool? get checkDate => getField<bool>('check_date');
  set checkDate(bool? value) => setField<bool>('check_date', value);

  String? get nameCompany => getField<String>('name_company');
  set nameCompany(String? value) => setField<String>('name_company', value);

  String? get okpo => getField<String>('OKPO');
  set okpo(String? value) => setField<String>('OKPO', value);

  String? get okved => getField<String>('OKVED');
  set okved(String? value) => setField<String>('OKVED', value);

  String? get abbreviatedNameCompany =>
      getField<String>('abbreviated_name_company');
  set abbreviatedNameCompany(String? value) =>
      setField<String>('abbreviated_name_company', value);

  String? get emailOwner => getField<String>('email_owner');
  set emailOwner(String? value) => setField<String>('email_owner', value);

  bool? get filingProfileCompany => getField<bool>('filing_profile_company');
  set filingProfileCompany(bool? value) =>
      setField<bool>('filing_profile_company', value);

  bool? get adminCompany => getField<bool>('admin_company');
  set adminCompany(bool? value) => setField<bool>('admin_company', value);

  bool? get contract => getField<bool>('contract');
  set contract(bool? value) => setField<bool>('contract', value);

  String? get directorName => getField<String>('director_name');
  set directorName(String? value) => setField<String>('director_name', value);

  String? get signatureUrl => getField<String>('signature_url');
  set signatureUrl(String? value) => setField<String>('signature_url', value);

  String? get stampUrl => getField<String>('stamp_url');
  set stampUrl(String? value) => setField<String>('stamp_url', value);

  String? get ndsPercent => getField<String>('nds_percent');
  set ndsPercent(String? value) => setField<String>('nds_percent', value);

  bool? get statusCurrentPayment => getField<bool>('status_current_payment');
  set statusCurrentPayment(bool? value) =>
      setField<bool>('status_current_payment', value);
}
