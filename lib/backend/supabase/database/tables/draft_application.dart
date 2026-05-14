import '../database.dart';

class DraftApplicationTable extends SupabaseTable<DraftApplicationRow> {
  @override
  String get tableName => 'draft_application';

  @override
  DraftApplicationRow createRow(Map<String, dynamic> data) =>
      DraftApplicationRow(data);
}

class DraftApplicationRow extends SupabaseDataRow {
  DraftApplicationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DraftApplicationTable();

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

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  DateTime? get paymentDate => getField<DateTime>('payment_date');
  set paymentDate(DateTime? value) => setField<DateTime>('payment_date', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

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
}
