import '../database.dart';

class AnswerTable extends SupabaseTable<AnswerRow> {
  @override
  String get tableName => 'answer';

  @override
  AnswerRow createRow(Map<String, dynamic> data) => AnswerRow(data);
}

class AnswerRow extends SupabaseDataRow {
  AnswerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnswerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  DateTime? get dateExcellent => getField<DateTime>('date_excellent');
  set dateExcellent(DateTime? value) =>
      setField<DateTime>('date_excellent', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get street => getField<String>('street');
  set street(String? value) => setField<String>('street', value);

  String? get house => getField<String>('house');
  set house(String? value) => setField<String>('house', value);

  String? get suggestedDate => getField<String>('suggested_date');
  set suggestedDate(String? value) => setField<String>('suggested_date', value);

  String? get suggestedTime => getField<String>('suggested_time');
  set suggestedTime(String? value) => setField<String>('suggested_time', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get createUser => getField<int>('create_user');
  set createUser(int? value) => setField<int>('create_user', value);

  List<int> get favourites => getListField<int>('favourites');
  set favourites(List<int>? value) => setListField<int>('favourites', value);

  String? get statusAnswer => getField<String>('status_answer');
  set statusAnswer(String? value) => setField<String>('status_answer', value);

  bool? get answerEdit => getField<bool>('answer_edit');
  set answerEdit(bool? value) => setField<bool>('answer_edit', value);

  int? get newPrice => getField<int>('new_price');
  set newPrice(int? value) => setField<int>('new_price', value);

  bool? get cancelled => getField<bool>('cancelled');
  set cancelled(bool? value) => setField<bool>('cancelled', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lon => getField<double>('lon');
  set lon(double? value) => setField<double>('lon', value);

  int? get commission => getField<int>('commission');
  set commission(int? value) => setField<int>('commission', value);

  double? get priceAfterCommission =>
      getField<double>('price_after_commission');
  set priceAfterCommission(double? value) =>
      setField<double>('price_after_commission', value);
}
