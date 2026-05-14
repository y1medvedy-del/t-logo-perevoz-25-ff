import '../database.dart';

class TimeVariablyTable extends SupabaseTable<TimeVariablyRow> {
  @override
  String get tableName => 'time _variably';

  @override
  TimeVariablyRow createRow(Map<String, dynamic> data) => TimeVariablyRow(data);
}

class TimeVariablyRow extends SupabaseDataRow {
  TimeVariablyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TimeVariablyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);
}
