import '../database.dart';

class ReviewsContentTable extends SupabaseTable<ReviewsContentRow> {
  @override
  String get tableName => 'reviews_content';

  @override
  ReviewsContentRow createRow(Map<String, dynamic> data) =>
      ReviewsContentRow(data);
}

class ReviewsContentRow extends SupabaseDataRow {
  ReviewsContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsContentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idReviews => getField<int>('id_reviews');
  set idReviews(int? value) => setField<int>('id_reviews', value);

  bool? get photo => getField<bool>('photo');
  set photo(bool? value) => setField<bool>('photo', value);

  bool? get video => getField<bool>('video');
  set video(bool? value) => setField<bool>('video', value);

  String? get referenceFile => getField<String>('reference_file');
  set referenceFile(String? value) => setField<String>('reference_file', value);

  bool? get doc => getField<bool>('doc');
  set doc(bool? value) => setField<bool>('doc', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
