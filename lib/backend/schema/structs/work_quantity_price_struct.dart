// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkQuantityPriceStruct extends BaseStruct {
  WorkQuantityPriceStruct({
    String? nameWork,
    int? quantity,
    int? price,
  })  : _nameWork = nameWork,
        _quantity = quantity,
        _price = price;

  // "name_work" field.
  String? _nameWork;
  String get nameWork => _nameWork ?? '';
  set nameWork(String? val) => _nameWork = val;

  bool hasNameWork() => _nameWork != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static WorkQuantityPriceStruct fromMap(Map<String, dynamic> data) =>
      WorkQuantityPriceStruct(
        nameWork: data['name_work'] as String?,
        quantity: castToType<int>(data['quantity']),
        price: castToType<int>(data['price']),
      );

  static WorkQuantityPriceStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkQuantityPriceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name_work': _nameWork,
        'quantity': _quantity,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name_work': serializeParam(
          _nameWork,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
      }.withoutNulls;

  static WorkQuantityPriceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WorkQuantityPriceStruct(
        nameWork: deserializeParam(
          data['name_work'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WorkQuantityPriceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkQuantityPriceStruct &&
        nameWork == other.nameWork &&
        quantity == other.quantity &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([nameWork, quantity, price]);
}

WorkQuantityPriceStruct createWorkQuantityPriceStruct({
  String? nameWork,
  int? quantity,
  int? price,
}) =>
    WorkQuantityPriceStruct(
      nameWork: nameWork,
      quantity: quantity,
      price: price,
    );
