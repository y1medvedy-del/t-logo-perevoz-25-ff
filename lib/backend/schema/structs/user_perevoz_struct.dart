// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPerevozStruct extends BaseStruct {
  UserPerevozStruct({
    String? id,
    String? name,
    String? surname,
    String? patronymic,
    bool? director,
    String? email,
    String? password,
    int? fillingProfil,
    String? avatar,
    String? typeURFIZ,
    String? typeCompany,
    String? phone,
  })  : _id = id,
        _name = name,
        _surname = surname,
        _patronymic = patronymic,
        _director = director,
        _email = email,
        _password = password,
        _fillingProfil = fillingProfil,
        _avatar = avatar,
        _typeURFIZ = typeURFIZ,
        _typeCompany = typeCompany,
        _phone = phone;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;

  bool hasSurname() => _surname != null;

  // "patronymic" field.
  String? _patronymic;
  String get patronymic => _patronymic ?? '';
  set patronymic(String? val) => _patronymic = val;

  bool hasPatronymic() => _patronymic != null;

  // "director" field.
  bool? _director;
  bool get director => _director ?? false;
  set director(bool? val) => _director = val;

  bool hasDirector() => _director != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "filling_profil" field.
  int? _fillingProfil;
  int get fillingProfil => _fillingProfil ?? 0;
  set fillingProfil(int? val) => _fillingProfil = val;

  void incrementFillingProfil(int amount) =>
      fillingProfil = fillingProfil + amount;

  bool hasFillingProfil() => _fillingProfil != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "type_UR-FIZ" field.
  String? _typeURFIZ;
  String get typeURFIZ => _typeURFIZ ?? '';
  set typeURFIZ(String? val) => _typeURFIZ = val;

  bool hasTypeURFIZ() => _typeURFIZ != null;

  // "type_company" field.
  String? _typeCompany;
  String get typeCompany => _typeCompany ?? '';
  set typeCompany(String? val) => _typeCompany = val;

  bool hasTypeCompany() => _typeCompany != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  static UserPerevozStruct fromMap(Map<String, dynamic> data) =>
      UserPerevozStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        surname: data['surname'] as String?,
        patronymic: data['patronymic'] as String?,
        director: data['director'] as bool?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        fillingProfil: castToType<int>(data['filling_profil']),
        avatar: data['avatar'] as String?,
        typeURFIZ: data['type_UR-FIZ'] as String?,
        typeCompany: data['type_company'] as String?,
        phone: data['phone'] as String?,
      );

  static UserPerevozStruct? maybeFromMap(dynamic data) => data is Map
      ? UserPerevozStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'surname': _surname,
        'patronymic': _patronymic,
        'director': _director,
        'email': _email,
        'password': _password,
        'filling_profil': _fillingProfil,
        'avatar': _avatar,
        'type_UR-FIZ': _typeURFIZ,
        'type_company': _typeCompany,
        'phone': _phone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
        'patronymic': serializeParam(
          _patronymic,
          ParamType.String,
        ),
        'director': serializeParam(
          _director,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'filling_profil': serializeParam(
          _fillingProfil,
          ParamType.int,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'type_UR-FIZ': serializeParam(
          _typeURFIZ,
          ParamType.String,
        ),
        'type_company': serializeParam(
          _typeCompany,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserPerevozStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserPerevozStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        patronymic: deserializeParam(
          data['patronymic'],
          ParamType.String,
          false,
        ),
        director: deserializeParam(
          data['director'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        fillingProfil: deserializeParam(
          data['filling_profil'],
          ParamType.int,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        typeURFIZ: deserializeParam(
          data['type_UR-FIZ'],
          ParamType.String,
          false,
        ),
        typeCompany: deserializeParam(
          data['type_company'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserPerevozStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserPerevozStruct &&
        id == other.id &&
        name == other.name &&
        surname == other.surname &&
        patronymic == other.patronymic &&
        director == other.director &&
        email == other.email &&
        password == other.password &&
        fillingProfil == other.fillingProfil &&
        avatar == other.avatar &&
        typeURFIZ == other.typeURFIZ &&
        typeCompany == other.typeCompany &&
        phone == other.phone;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        surname,
        patronymic,
        director,
        email,
        password,
        fillingProfil,
        avatar,
        typeURFIZ,
        typeCompany,
        phone
      ]);
}

UserPerevozStruct createUserPerevozStruct({
  String? id,
  String? name,
  String? surname,
  String? patronymic,
  bool? director,
  String? email,
  String? password,
  int? fillingProfil,
  String? avatar,
  String? typeURFIZ,
  String? typeCompany,
  String? phone,
}) =>
    UserPerevozStruct(
      id: id,
      name: name,
      surname: surname,
      patronymic: patronymic,
      director: director,
      email: email,
      password: password,
      fillingProfil: fillingProfil,
      avatar: avatar,
      typeURFIZ: typeURFIZ,
      typeCompany: typeCompany,
      phone: phone,
    );
