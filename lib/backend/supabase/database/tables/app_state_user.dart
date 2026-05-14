import '../database.dart';

class AppStateUserTable extends SupabaseTable<AppStateUserRow> {
  @override
  String get tableName => 'app_state_user';

  @override
  AppStateUserRow createRow(Map<String, dynamic> data) => AppStateUserRow(data);
}

class AppStateUserRow extends SupabaseDataRow {
  AppStateUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppStateUserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  List<dynamic> get drawtList => getListField<dynamic>('drawt_list');
  set drawtList(List<dynamic>? value) =>
      setListField<dynamic>('drawt_list', value);

  DateTime? get updatedAtDraft => getField<DateTime>('updated_at_draft');
  set updatedAtDraft(DateTime? value) =>
      setField<DateTime>('updated_at_draft', value);
}
