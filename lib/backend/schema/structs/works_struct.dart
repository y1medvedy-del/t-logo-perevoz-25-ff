// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorksStruct extends BaseStruct {
  WorksStruct({
    int? idApplication,
    int? idAnswer,
    String? nameService,
    int? quantity,
    String? uniteSize,
    int? price,
    int? newQuantity,
    int? newPrice,
    String? typeGruz,
  })  : _idApplication = idApplication,
        _idAnswer = idAnswer,
        _nameService = nameService,
        _quantity = quantity,
        _uniteSize = uniteSize,
        _price = price,
        _newQuantity = newQuantity,
        _newPrice = newPrice,
        _typeGruz = typeGruz;

  // "idApplication" field.
  int? _idApplication;
  int get idApplication => _idApplication ?? 0;
  set idApplication(int? val) => _idApplication = val;

  void incrementIdApplication(int amount) =>
      idApplication = idApplication + amount;

  bool hasIdApplication() => _idApplication != null;

  // "idAnswer" field.
  int? _idAnswer;
  int get idAnswer => _idAnswer ?? 0;
  set idAnswer(int? val) => _idAnswer = val;

  void incrementIdAnswer(int amount) => idAnswer = idAnswer + amount;

  bool hasIdAnswer() => _idAnswer != null;

  // "nameService" field.
  String? _nameService;
  String get nameService => _nameService ?? '';
  set nameService(String? val) => _nameService = val;

  bool hasNameService() => _nameService != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "unite_size" field.
  String? _uniteSize;
  String get uniteSize => _uniteSize ?? '';
  set uniteSize(String? val) => _uniteSize = val;

  bool hasUniteSize() => _uniteSize != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "newQuantity" field.
  int? _newQuantity;
  int get newQuantity => _newQuantity ?? 0;
  set newQuantity(int? val) => _newQuantity = val;

  void incrementNewQuantity(int amount) => newQuantity = newQuantity + amount;

  bool hasNewQuantity() => _newQuantity != null;

  // "newPrice" field.
  int? _newPrice;
  int get newPrice => _newPrice ?? 0;
  set newPrice(int? val) => _newPrice = val;

  void incrementNewPrice(int amount) => newPrice = newPrice + amount;

  bool hasNewPrice() => _newPrice != null;

  // "typeGruz" field.
  String? _typeGruz;
  String get typeGruz => _typeGruz ?? '';
  set typeGruz(String? val) => _typeGruz = val;

  bool hasTypeGruz() => _typeGruz != null;

  static WorksStruct fromMap(Map<String, dynamic> data) => WorksStruct(
        idApplication: castToType<int>(data['idApplication']),
        idAnswer: castToType<int>(data['idAnswer']),
        nameService: data['nameService'] as String?,
        quantity: castToType<int>(data['quantity']),
        uniteSize: data['unite_size'] as String?,
        price: castToType<int>(data['price']),
        newQuantity: castToType<int>(data['newQuantity']),
        newPrice: castToType<int>(data['newPrice']),
        typeGruz: data['typeGruz'] as String?,
      );

  static WorksStruct? maybeFromMap(dynamic data) =>
      data is Map ? WorksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'idApplication': _idApplication,
        'idAnswer': _idAnswer,
        'nameService': _nameService,
        'quantity': _quantity,
        'unite_size': _uniteSize,
        'price': _price,
        'newQuantity': _newQuantity,
        'newPrice': _newPrice,
        'typeGruz': _typeGruz,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idApplication': serializeParam(
          _idApplication,
          ParamType.int,
        ),
        'idAnswer': serializeParam(
          _idAnswer,
          ParamType.int,
        ),
        'nameService': serializeParam(
          _nameService,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'unite_size': serializeParam(
          _uniteSize,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'newQuantity': serializeParam(
          _newQuantity,
          ParamType.int,
        ),
        'newPrice': serializeParam(
          _newPrice,
          ParamType.int,
        ),
        'typeGruz': serializeParam(
          _typeGruz,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorksStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorksStruct(
        idApplication: deserializeParam(
          data['idApplication'],
          ParamType.int,
          false,
        ),
        idAnswer: deserializeParam(
          data['idAnswer'],
          ParamType.int,
          false,
        ),
        nameService: deserializeParam(
          data['nameService'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        uniteSize: deserializeParam(
          data['unite_size'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        newQuantity: deserializeParam(
          data['newQuantity'],
          ParamType.int,
          false,
        ),
        newPrice: deserializeParam(
          data['newPrice'],
          ParamType.int,
          false,
        ),
        typeGruz: deserializeParam(
          data['typeGruz'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorksStruct &&
        idApplication == other.idApplication &&
        idAnswer == other.idAnswer &&
        nameService == other.nameService &&
        quantity == other.quantity &&
        uniteSize == other.uniteSize &&
        price == other.price &&
        newQuantity == other.newQuantity &&
        newPrice == other.newPrice &&
        typeGruz == other.typeGruz;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idApplication,
        idAnswer,
        nameService,
        quantity,
        uniteSize,
        price,
        newQuantity,
        newPrice,
        typeGruz
      ]);
}

WorksStruct createWorksStruct({
  int? idApplication,
  int? idAnswer,
  String? nameService,
  int? quantity,
  String? uniteSize,
  int? price,
  int? newQuantity,
  int? newPrice,
  String? typeGruz,
}) =>
    WorksStruct(
      idApplication: idApplication,
      idAnswer: idAnswer,
      nameService: nameService,
      quantity: quantity,
      uniteSize: uniteSize,
      price: price,
      newQuantity: newQuantity,
      newPrice: newPrice,
      typeGruz: typeGruz,
    );
