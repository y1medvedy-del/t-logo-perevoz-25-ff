import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get log => getField<String>('log');
  set log(String? value) => setField<String>('log', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get link => getField<int>('link');
  set link(int? value) => setField<int>('link', value);

  bool? get viewed => getField<bool>('viewed');
  set viewed(bool? value) => setField<bool>('viewed', value);

  int? get chat => getField<int>('chat');
  set chat(int? value) => setField<int>('chat', value);

  bool? get admin => getField<bool>('admin');
  set admin(bool? value) => setField<bool>('admin', value);

  int? get applicationId => getField<int>('application_id');
  set applicationId(int? value) => setField<int>('application_id', value);

  int? get newUser => getField<int>('new_user');
  set newUser(int? value) => setField<int>('new_user', value);

  int? get feedBack => getField<int>('feed_back');
  set feedBack(int? value) => setField<int>('feed_back', value);

  int? get complaint => getField<int>('complaint');
  set complaint(int? value) => setField<int>('complaint', value);

  int? get paymentInvoice => getField<int>('payment_invoice');
  set paymentInvoice(int? value) => setField<int>('payment_invoice', value);

  int? get fine => getField<int>('fine');
  set fine(int? value) => setField<int>('fine', value);

  int? get replayceOutput => getField<int>('replayce_output');
  set replayceOutput(int? value) => setField<int>('replayce_output', value);

  bool? get house => getField<bool>('house');
  set house(bool? value) => setField<bool>('house', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
