import '../database.dart';

class NotificationAdminTable extends SupabaseTable<NotificationAdminRow> {
  @override
  String get tableName => 'notification_admin';

  @override
  NotificationAdminRow createRow(Map<String, dynamic> data) =>
      NotificationAdminRow(data);
}

class NotificationAdminRow extends SupabaseDataRow {
  NotificationAdminRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationAdminTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  bool? get warehouse => getField<bool>('warehouse');
  set warehouse(bool? value) => setField<bool>('warehouse', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  List<int> get usersSaw => getListField<int>('users_saw');
  set usersSaw(List<int>? value) => setListField<int>('users_saw', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);
}
