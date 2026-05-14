// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AplicationLocalStruct extends BaseStruct {
  AplicationLocalStruct({
    String? addressStreet,
    String? addressHouse,
    String? typeCargo,
    String? desiretDate,
    String? desiretTime,
    String? description,
    String? paymentType,
    List<WorksStruct>? declaredWorks,
    int? cityId,
    String? cityName,
    double? lat,
    double? lon,
    DateTime? createDate,
    int? creatinStage,
    bool? draft,
    String? cityAbriviatyre,
    List<String>? photoList,
    List<String>? videoList,
    String? phoneDriver,
    String? namberCar,
    String? nameCar,
    String? surnameDriver,
    String? nameDriver,
    String? patronymicDriver,

    /// номер в массиве черновиков
    int? draftItem,

    /// область города
    String? areaCity,
  })  : _addressStreet = addressStreet,
        _addressHouse = addressHouse,
        _typeCargo = typeCargo,
        _desiretDate = desiretDate,
        _desiretTime = desiretTime,
        _description = description,
        _paymentType = paymentType,
        _declaredWorks = declaredWorks,
        _cityId = cityId,
        _cityName = cityName,
        _lat = lat,
        _lon = lon,
        _createDate = createDate,
        _creatinStage = creatinStage,
        _draft = draft,
        _cityAbriviatyre = cityAbriviatyre,
        _photoList = photoList,
        _videoList = videoList,
        _phoneDriver = phoneDriver,
        _namberCar = namberCar,
        _nameCar = nameCar,
        _surnameDriver = surnameDriver,
        _nameDriver = nameDriver,
        _patronymicDriver = patronymicDriver,
        _draftItem = draftItem,
        _areaCity = areaCity;

  // "address_street" field.
  String? _addressStreet;
  String get addressStreet => _addressStreet ?? '';
  set addressStreet(String? val) => _addressStreet = val;

  bool hasAddressStreet() => _addressStreet != null;

  // "address_house" field.
  String? _addressHouse;
  String get addressHouse => _addressHouse ?? '';
  set addressHouse(String? val) => _addressHouse = val;

  bool hasAddressHouse() => _addressHouse != null;

  // "type_cargo" field.
  String? _typeCargo;
  String get typeCargo => _typeCargo ?? '';
  set typeCargo(String? val) => _typeCargo = val;

  bool hasTypeCargo() => _typeCargo != null;

  // "desiret_date" field.
  String? _desiretDate;
  String get desiretDate => _desiretDate ?? '';
  set desiretDate(String? val) => _desiretDate = val;

  bool hasDesiretDate() => _desiretDate != null;

  // "desiret_time" field.
  String? _desiretTime;
  String get desiretTime => _desiretTime ?? '';
  set desiretTime(String? val) => _desiretTime = val;

  bool hasDesiretTime() => _desiretTime != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  set paymentType(String? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  // "declared_works" field.
  List<WorksStruct>? _declaredWorks;
  List<WorksStruct> get declaredWorks => _declaredWorks ?? const [];
  set declaredWorks(List<WorksStruct>? val) => _declaredWorks = val;

  void updateDeclaredWorks(Function(List<WorksStruct>) updateFn) {
    updateFn(_declaredWorks ??= []);
  }

  bool hasDeclaredWorks() => _declaredWorks != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lon" field.
  double? _lon;
  double get lon => _lon ?? 0.0;
  set lon(double? val) => _lon = val;

  void incrementLon(double amount) => lon = lon + amount;

  bool hasLon() => _lon != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "creatin_stage" field.
  int? _creatinStage;
  int get creatinStage => _creatinStage ?? 0;
  set creatinStage(int? val) => _creatinStage = val;

  void incrementCreatinStage(int amount) =>
      creatinStage = creatinStage + amount;

  bool hasCreatinStage() => _creatinStage != null;

  // "draft" field.
  bool? _draft;
  bool get draft => _draft ?? false;
  set draft(bool? val) => _draft = val;

  bool hasDraft() => _draft != null;

  // "cityAbriviatyre" field.
  String? _cityAbriviatyre;
  String get cityAbriviatyre => _cityAbriviatyre ?? '';
  set cityAbriviatyre(String? val) => _cityAbriviatyre = val;

  bool hasCityAbriviatyre() => _cityAbriviatyre != null;

  // "photoList" field.
  List<String>? _photoList;
  List<String> get photoList => _photoList ?? const [];
  set photoList(List<String>? val) => _photoList = val;

  void updatePhotoList(Function(List<String>) updateFn) {
    updateFn(_photoList ??= []);
  }

  bool hasPhotoList() => _photoList != null;

  // "videoList" field.
  List<String>? _videoList;
  List<String> get videoList => _videoList ?? const [];
  set videoList(List<String>? val) => _videoList = val;

  void updateVideoList(Function(List<String>) updateFn) {
    updateFn(_videoList ??= []);
  }

  bool hasVideoList() => _videoList != null;

  // "phoneDriver" field.
  String? _phoneDriver;
  String get phoneDriver => _phoneDriver ?? '';
  set phoneDriver(String? val) => _phoneDriver = val;

  bool hasPhoneDriver() => _phoneDriver != null;

  // "namberCar" field.
  String? _namberCar;
  String get namberCar => _namberCar ?? '';
  set namberCar(String? val) => _namberCar = val;

  bool hasNamberCar() => _namberCar != null;

  // "nameCar" field.
  String? _nameCar;
  String get nameCar => _nameCar ?? '';
  set nameCar(String? val) => _nameCar = val;

  bool hasNameCar() => _nameCar != null;

  // "surname_driver" field.
  String? _surnameDriver;
  String get surnameDriver => _surnameDriver ?? '';
  set surnameDriver(String? val) => _surnameDriver = val;

  bool hasSurnameDriver() => _surnameDriver != null;

  // "name_driver" field.
  String? _nameDriver;
  String get nameDriver => _nameDriver ?? '';
  set nameDriver(String? val) => _nameDriver = val;

  bool hasNameDriver() => _nameDriver != null;

  // "patronymic_driver" field.
  String? _patronymicDriver;
  String get patronymicDriver => _patronymicDriver ?? '';
  set patronymicDriver(String? val) => _patronymicDriver = val;

  bool hasPatronymicDriver() => _patronymicDriver != null;

  // "draftItem" field.
  int? _draftItem;
  int get draftItem => _draftItem ?? 0;
  set draftItem(int? val) => _draftItem = val;

  void incrementDraftItem(int amount) => draftItem = draftItem + amount;

  bool hasDraftItem() => _draftItem != null;

  // "areaCity" field.
  String? _areaCity;
  String get areaCity => _areaCity ?? '';
  set areaCity(String? val) => _areaCity = val;

  bool hasAreaCity() => _areaCity != null;

  static AplicationLocalStruct fromMap(Map<String, dynamic> data) =>
      AplicationLocalStruct(
        addressStreet: data['address_street'] as String?,
        addressHouse: data['address_house'] as String?,
        typeCargo: data['type_cargo'] as String?,
        desiretDate: data['desiret_date'] as String?,
        desiretTime: data['desiret_time'] as String?,
        description: data['description'] as String?,
        paymentType: data['payment_type'] as String?,
        declaredWorks: getStructList(
          data['declared_works'],
          WorksStruct.fromMap,
        ),
        cityId: castToType<int>(data['city_id']),
        cityName: data['city_name'] as String?,
        lat: castToType<double>(data['lat']),
        lon: castToType<double>(data['lon']),
        createDate: data['create_date'] as DateTime?,
        creatinStage: castToType<int>(data['creatin_stage']),
        draft: data['draft'] as bool?,
        cityAbriviatyre: data['cityAbriviatyre'] as String?,
        photoList: getDataList(data['photoList']),
        videoList: getDataList(data['videoList']),
        phoneDriver: data['phoneDriver'] as String?,
        namberCar: data['namberCar'] as String?,
        nameCar: data['nameCar'] as String?,
        surnameDriver: data['surname_driver'] as String?,
        nameDriver: data['name_driver'] as String?,
        patronymicDriver: data['patronymic_driver'] as String?,
        draftItem: castToType<int>(data['draftItem']),
        areaCity: data['areaCity'] as String?,
      );

  static AplicationLocalStruct? maybeFromMap(dynamic data) => data is Map
      ? AplicationLocalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'address_street': _addressStreet,
        'address_house': _addressHouse,
        'type_cargo': _typeCargo,
        'desiret_date': _desiretDate,
        'desiret_time': _desiretTime,
        'description': _description,
        'payment_type': _paymentType,
        'declared_works': _declaredWorks?.map((e) => e.toMap()).toList(),
        'city_id': _cityId,
        'city_name': _cityName,
        'lat': _lat,
        'lon': _lon,
        'create_date': _createDate,
        'creatin_stage': _creatinStage,
        'draft': _draft,
        'cityAbriviatyre': _cityAbriviatyre,
        'photoList': _photoList,
        'videoList': _videoList,
        'phoneDriver': _phoneDriver,
        'namberCar': _namberCar,
        'nameCar': _nameCar,
        'surname_driver': _surnameDriver,
        'name_driver': _nameDriver,
        'patronymic_driver': _patronymicDriver,
        'draftItem': _draftItem,
        'areaCity': _areaCity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address_street': serializeParam(
          _addressStreet,
          ParamType.String,
        ),
        'address_house': serializeParam(
          _addressHouse,
          ParamType.String,
        ),
        'type_cargo': serializeParam(
          _typeCargo,
          ParamType.String,
        ),
        'desiret_date': serializeParam(
          _desiretDate,
          ParamType.String,
        ),
        'desiret_time': serializeParam(
          _desiretTime,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'payment_type': serializeParam(
          _paymentType,
          ParamType.String,
        ),
        'declared_works': serializeParam(
          _declaredWorks,
          ParamType.DataStruct,
          isList: true,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'city_name': serializeParam(
          _cityName,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lon': serializeParam(
          _lon,
          ParamType.double,
        ),
        'create_date': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
        'creatin_stage': serializeParam(
          _creatinStage,
          ParamType.int,
        ),
        'draft': serializeParam(
          _draft,
          ParamType.bool,
        ),
        'cityAbriviatyre': serializeParam(
          _cityAbriviatyre,
          ParamType.String,
        ),
        'photoList': serializeParam(
          _photoList,
          ParamType.String,
          isList: true,
        ),
        'videoList': serializeParam(
          _videoList,
          ParamType.String,
          isList: true,
        ),
        'phoneDriver': serializeParam(
          _phoneDriver,
          ParamType.String,
        ),
        'namberCar': serializeParam(
          _namberCar,
          ParamType.String,
        ),
        'nameCar': serializeParam(
          _nameCar,
          ParamType.String,
        ),
        'surname_driver': serializeParam(
          _surnameDriver,
          ParamType.String,
        ),
        'name_driver': serializeParam(
          _nameDriver,
          ParamType.String,
        ),
        'patronymic_driver': serializeParam(
          _patronymicDriver,
          ParamType.String,
        ),
        'draftItem': serializeParam(
          _draftItem,
          ParamType.int,
        ),
        'areaCity': serializeParam(
          _areaCity,
          ParamType.String,
        ),
      }.withoutNulls;

  static AplicationLocalStruct fromSerializableMap(Map<String, dynamic> data) =>
      AplicationLocalStruct(
        addressStreet: deserializeParam(
          data['address_street'],
          ParamType.String,
          false,
        ),
        addressHouse: deserializeParam(
          data['address_house'],
          ParamType.String,
          false,
        ),
        typeCargo: deserializeParam(
          data['type_cargo'],
          ParamType.String,
          false,
        ),
        desiretDate: deserializeParam(
          data['desiret_date'],
          ParamType.String,
          false,
        ),
        desiretTime: deserializeParam(
          data['desiret_time'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        paymentType: deserializeParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        declaredWorks: deserializeStructParam<WorksStruct>(
          data['declared_works'],
          ParamType.DataStruct,
          true,
          structBuilder: WorksStruct.fromSerializableMap,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        cityName: deserializeParam(
          data['city_name'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lon: deserializeParam(
          data['lon'],
          ParamType.double,
          false,
        ),
        createDate: deserializeParam(
          data['create_date'],
          ParamType.DateTime,
          false,
        ),
        creatinStage: deserializeParam(
          data['creatin_stage'],
          ParamType.int,
          false,
        ),
        draft: deserializeParam(
          data['draft'],
          ParamType.bool,
          false,
        ),
        cityAbriviatyre: deserializeParam(
          data['cityAbriviatyre'],
          ParamType.String,
          false,
        ),
        photoList: deserializeParam<String>(
          data['photoList'],
          ParamType.String,
          true,
        ),
        videoList: deserializeParam<String>(
          data['videoList'],
          ParamType.String,
          true,
        ),
        phoneDriver: deserializeParam(
          data['phoneDriver'],
          ParamType.String,
          false,
        ),
        namberCar: deserializeParam(
          data['namberCar'],
          ParamType.String,
          false,
        ),
        nameCar: deserializeParam(
          data['nameCar'],
          ParamType.String,
          false,
        ),
        surnameDriver: deserializeParam(
          data['surname_driver'],
          ParamType.String,
          false,
        ),
        nameDriver: deserializeParam(
          data['name_driver'],
          ParamType.String,
          false,
        ),
        patronymicDriver: deserializeParam(
          data['patronymic_driver'],
          ParamType.String,
          false,
        ),
        draftItem: deserializeParam(
          data['draftItem'],
          ParamType.int,
          false,
        ),
        areaCity: deserializeParam(
          data['areaCity'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AplicationLocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AplicationLocalStruct &&
        addressStreet == other.addressStreet &&
        addressHouse == other.addressHouse &&
        typeCargo == other.typeCargo &&
        desiretDate == other.desiretDate &&
        desiretTime == other.desiretTime &&
        description == other.description &&
        paymentType == other.paymentType &&
        listEquality.equals(declaredWorks, other.declaredWorks) &&
        cityId == other.cityId &&
        cityName == other.cityName &&
        lat == other.lat &&
        lon == other.lon &&
        createDate == other.createDate &&
        creatinStage == other.creatinStage &&
        draft == other.draft &&
        cityAbriviatyre == other.cityAbriviatyre &&
        listEquality.equals(photoList, other.photoList) &&
        listEquality.equals(videoList, other.videoList) &&
        phoneDriver == other.phoneDriver &&
        namberCar == other.namberCar &&
        nameCar == other.nameCar &&
        surnameDriver == other.surnameDriver &&
        nameDriver == other.nameDriver &&
        patronymicDriver == other.patronymicDriver &&
        draftItem == other.draftItem &&
        areaCity == other.areaCity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        addressStreet,
        addressHouse,
        typeCargo,
        desiretDate,
        desiretTime,
        description,
        paymentType,
        declaredWorks,
        cityId,
        cityName,
        lat,
        lon,
        createDate,
        creatinStage,
        draft,
        cityAbriviatyre,
        photoList,
        videoList,
        phoneDriver,
        namberCar,
        nameCar,
        surnameDriver,
        nameDriver,
        patronymicDriver,
        draftItem,
        areaCity
      ]);
}

AplicationLocalStruct createAplicationLocalStruct({
  String? addressStreet,
  String? addressHouse,
  String? typeCargo,
  String? desiretDate,
  String? desiretTime,
  String? description,
  String? paymentType,
  int? cityId,
  String? cityName,
  double? lat,
  double? lon,
  DateTime? createDate,
  int? creatinStage,
  bool? draft,
  String? cityAbriviatyre,
  String? phoneDriver,
  String? namberCar,
  String? nameCar,
  String? surnameDriver,
  String? nameDriver,
  String? patronymicDriver,
  int? draftItem,
  String? areaCity,
}) =>
    AplicationLocalStruct(
      addressStreet: addressStreet,
      addressHouse: addressHouse,
      typeCargo: typeCargo,
      desiretDate: desiretDate,
      desiretTime: desiretTime,
      description: description,
      paymentType: paymentType,
      cityId: cityId,
      cityName: cityName,
      lat: lat,
      lon: lon,
      createDate: createDate,
      creatinStage: creatinStage,
      draft: draft,
      cityAbriviatyre: cityAbriviatyre,
      phoneDriver: phoneDriver,
      namberCar: namberCar,
      nameCar: nameCar,
      surnameDriver: surnameDriver,
      nameDriver: nameDriver,
      patronymicDriver: patronymicDriver,
      draftItem: draftItem,
      areaCity: areaCity,
    );
