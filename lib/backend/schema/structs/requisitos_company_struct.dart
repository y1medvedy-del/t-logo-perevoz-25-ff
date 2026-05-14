// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequisitosCompanyStruct extends BaseStruct {
  RequisitosCompanyStruct({
    String? name,
    String? typeCompany,
    int? inn,
    String? address,
    String? okved,
    String? ogrn,
    String? okpo,
    String? kpp,

    /// заключен контракт или нет
    bool? contract,
  })  : _name = name,
        _typeCompany = typeCompany,
        _inn = inn,
        _address = address,
        _okved = okved,
        _ogrn = ogrn,
        _okpo = okpo,
        _kpp = kpp,
        _contract = contract;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "typeCompany" field.
  String? _typeCompany;
  String get typeCompany => _typeCompany ?? '';
  set typeCompany(String? val) => _typeCompany = val;

  bool hasTypeCompany() => _typeCompany != null;

  // "inn" field.
  int? _inn;
  int get inn => _inn ?? 0;
  set inn(int? val) => _inn = val;

  void incrementInn(int amount) => inn = inn + amount;

  bool hasInn() => _inn != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "okved" field.
  String? _okved;
  String get okved => _okved ?? '';
  set okved(String? val) => _okved = val;

  bool hasOkved() => _okved != null;

  // "ogrn" field.
  String? _ogrn;
  String get ogrn => _ogrn ?? '';
  set ogrn(String? val) => _ogrn = val;

  bool hasOgrn() => _ogrn != null;

  // "okpo" field.
  String? _okpo;
  String get okpo => _okpo ?? '';
  set okpo(String? val) => _okpo = val;

  bool hasOkpo() => _okpo != null;

  // "kpp" field.
  String? _kpp;
  String get kpp => _kpp ?? '';
  set kpp(String? val) => _kpp = val;

  bool hasKpp() => _kpp != null;

  // "contract" field.
  bool? _contract;
  bool get contract => _contract ?? false;
  set contract(bool? val) => _contract = val;

  bool hasContract() => _contract != null;

  static RequisitosCompanyStruct fromMap(Map<String, dynamic> data) =>
      RequisitosCompanyStruct(
        name: data['name'] as String?,
        typeCompany: data['typeCompany'] as String?,
        inn: castToType<int>(data['inn']),
        address: data['address'] as String?,
        okved: data['okved'] as String?,
        ogrn: data['ogrn'] as String?,
        okpo: data['okpo'] as String?,
        kpp: data['kpp'] as String?,
        contract: data['contract'] as bool?,
      );

  static RequisitosCompanyStruct? maybeFromMap(dynamic data) => data is Map
      ? RequisitosCompanyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'typeCompany': _typeCompany,
        'inn': _inn,
        'address': _address,
        'okved': _okved,
        'ogrn': _ogrn,
        'okpo': _okpo,
        'kpp': _kpp,
        'contract': _contract,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'typeCompany': serializeParam(
          _typeCompany,
          ParamType.String,
        ),
        'inn': serializeParam(
          _inn,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'okved': serializeParam(
          _okved,
          ParamType.String,
        ),
        'ogrn': serializeParam(
          _ogrn,
          ParamType.String,
        ),
        'okpo': serializeParam(
          _okpo,
          ParamType.String,
        ),
        'kpp': serializeParam(
          _kpp,
          ParamType.String,
        ),
        'contract': serializeParam(
          _contract,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RequisitosCompanyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RequisitosCompanyStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        typeCompany: deserializeParam(
          data['typeCompany'],
          ParamType.String,
          false,
        ),
        inn: deserializeParam(
          data['inn'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        okved: deserializeParam(
          data['okved'],
          ParamType.String,
          false,
        ),
        ogrn: deserializeParam(
          data['ogrn'],
          ParamType.String,
          false,
        ),
        okpo: deserializeParam(
          data['okpo'],
          ParamType.String,
          false,
        ),
        kpp: deserializeParam(
          data['kpp'],
          ParamType.String,
          false,
        ),
        contract: deserializeParam(
          data['contract'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RequisitosCompanyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RequisitosCompanyStruct &&
        name == other.name &&
        typeCompany == other.typeCompany &&
        inn == other.inn &&
        address == other.address &&
        okved == other.okved &&
        ogrn == other.ogrn &&
        okpo == other.okpo &&
        kpp == other.kpp &&
        contract == other.contract;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, typeCompany, inn, address, okved, ogrn, okpo, kpp, contract]);
}

RequisitosCompanyStruct createRequisitosCompanyStruct({
  String? name,
  String? typeCompany,
  int? inn,
  String? address,
  String? okved,
  String? ogrn,
  String? okpo,
  String? kpp,
  bool? contract,
}) =>
    RequisitosCompanyStruct(
      name: name,
      typeCompany: typeCompany,
      inn: inn,
      address: address,
      okved: okved,
      ogrn: ogrn,
      okpo: okpo,
      kpp: kpp,
      contract: contract,
    );
