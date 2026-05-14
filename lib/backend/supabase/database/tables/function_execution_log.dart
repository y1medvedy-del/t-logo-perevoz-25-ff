import '../database.dart';

class FunctionExecutionLogTable extends SupabaseTable<FunctionExecutionLogRow> {
  @override
  String get tableName => 'function_execution_log';

  @override
  FunctionExecutionLogRow createRow(Map<String, dynamic> data) =>
      FunctionExecutionLogRow(data);
}

class FunctionExecutionLogRow extends SupabaseDataRow {
  FunctionExecutionLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FunctionExecutionLogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get executionTime => getField<DateTime>('execution_time')!;
  set executionTime(DateTime value) =>
      setField<DateTime>('execution_time', value);

  String get functionName => getField<String>('function_name')!;
  set functionName(String value) => setField<String>('function_name', value);

  List<int> get rowsAffected => getListField<int>('rows_affected');
  set rowsAffected(List<int>? value) =>
      setListField<int>('rows_affected', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);
}
