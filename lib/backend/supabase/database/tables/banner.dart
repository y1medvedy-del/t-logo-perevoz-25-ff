import '../database.dart';

class BannerTable extends SupabaseTable<BannerRow> {
  @override
  String get tableName => 'banner';

  @override
  BannerRow createRow(Map<String, dynamic> data) => BannerRow(data);
}

class BannerRow extends SupabaseDataRow {
  BannerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BannerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get linkImage => getField<String>('link image');
  set linkImage(String? value) => setField<String>('link image', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  bool? get wareHause => getField<bool>('ware hause');
  set wareHause(bool? value) => setField<bool>('ware hause', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);

  String? get linkSource => getField<String>('link source');
  set linkSource(String? value) => setField<String>('link source', value);
}
