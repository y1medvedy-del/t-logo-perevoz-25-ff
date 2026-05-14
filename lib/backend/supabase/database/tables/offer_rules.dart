import '../database.dart';

class OfferRulesTable extends SupabaseTable<OfferRulesRow> {
  @override
  String get tableName => 'offer_rules';

  @override
  OfferRulesRow createRow(Map<String, dynamic> data) => OfferRulesRow(data);
}

class OfferRulesRow extends SupabaseDataRow {
  OfferRulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OfferRulesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get linkDoc => getField<String>('link_doc');
  set linkDoc(String? value) => setField<String>('link_doc', value);

  bool? get carrier => getField<bool>('carrier');
  set carrier(bool? value) => setField<bool>('carrier', value);

  bool? get warehouse => getField<bool>('warehouse');
  set warehouse(bool? value) => setField<bool>('warehouse', value);

  bool? get archive => getField<bool>('archive');
  set archive(bool? value) => setField<bool>('archive', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);
}
