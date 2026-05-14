import '../database.dart';

class DayTable extends SupabaseTable<DayRow> {
  @override
  String get tableName => 'day';

  @override
  DayRow createRow(Map<String, dynamic> data) => DayRow(data);
}

class DayRow extends SupabaseDataRow {
  DayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DayTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get number => getField<int>('number');
  set number(int? value) => setField<int>('number', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  bool? get flag => getField<bool>('flag');
  set flag(bool? value) => setField<bool>('flag', value);
}
