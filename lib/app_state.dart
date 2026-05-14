import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userLocal')) {
        try {
          final serializedData = prefs.getString('ff_userLocal') ?? '{}';
          _userLocal =
              UserPerevozStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _firstVisit = prefs.getBool('ff_firstVisit') ?? _firstVisit;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_aplicationLocal')) {
        try {
          final serializedData = prefs.getString('ff_aplicationLocal') ?? '{}';
          _aplicationLocal = AplicationLocalStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_localRequisitesCompany')) {
        try {
          final serializedData =
              prefs.getString('ff_localRequisitesCompany') ?? '{}';
          _localRequisitesCompany = RequisitosCompanyStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _filingProfil = prefs.getBool('ff_filingProfil') ?? _filingProfil;
    });
    _safeInit(() {
      _typeUser = prefs.getString('ff_typeUser') ?? _typeUser;
    });
    _safeInit(() {
      _myID = prefs.getInt('ff_myID') ?? _myID;
    });
    _safeInit(() {
      _myCompany = prefs.getInt('ff_myCompany') ?? _myCompany;
    });
    _safeInit(() {
      _fcmToken = prefs.getString('ff_fcmToken') ?? _fcmToken;
    });
    _safeInit(() {
      _localApplicationList = prefs
              .getStringList('ff_localApplicationList')
              ?.map((x) {
                try {
                  return AplicationLocalStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _localApplicationList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_mySettings')) {
        try {
          final serializedData = prefs.getString('ff_mySettings') ?? '{}';
          _mySettings =
              SettingsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _updateDateDraft = prefs.containsKey('ff_updateDateDraft')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_updateDateDraft')!)
          : _updateDateDraft;
    });
    _safeInit(() {
      _lastPaymentId = prefs.getString('ff_lastPaymentId') ?? _lastPaymentId;
    });
    _safeInit(() {
      _lastOrderId = prefs.getString('ff_lastOrderId') ?? _lastOrderId;
    });
    _safeInit(() {
      _lastPaymentPurpose =
          prefs.getString('ff_lastPaymentPurpose') ?? _lastPaymentPurpose;
    });
    _safeInit(() {
      _lastTargetType = prefs.getString('ff_lastTargetType') ?? _lastTargetType;
    });
    _safeInit(() {
      _lastTargetId = prefs.getInt('ff_lastTargetId') ?? _lastTargetId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserPerevozStruct _userLocal = UserPerevozStruct.fromSerializableMap(
      jsonDecode('{\"filling_profil\":\"1\"}'));
  UserPerevozStruct get userLocal => _userLocal;
  set userLocal(UserPerevozStruct value) {
    _userLocal = value;
    prefs.setString('ff_userLocal', value.serialize());
  }

  void updateUserLocalStruct(Function(UserPerevozStruct) updateFn) {
    updateFn(_userLocal);
    prefs.setString('ff_userLocal', _userLocal.serialize());
  }

  bool _firstVisit = true;
  bool get firstVisit => _firstVisit;
  set firstVisit(bool value) {
    _firstVisit = value;
    prefs.setBool('ff_firstVisit', value);
  }

  AplicationLocalStruct _aplicationLocal = AplicationLocalStruct();
  AplicationLocalStruct get aplicationLocal => _aplicationLocal;
  set aplicationLocal(AplicationLocalStruct value) {
    _aplicationLocal = value;
    prefs.setString('ff_aplicationLocal', value.serialize());
  }

  void updateAplicationLocalStruct(Function(AplicationLocalStruct) updateFn) {
    updateFn(_aplicationLocal);
    prefs.setString('ff_aplicationLocal', _aplicationLocal.serialize());
  }

  RequisitosCompanyStruct _localRequisitesCompany = RequisitosCompanyStruct();
  RequisitosCompanyStruct get localRequisitesCompany => _localRequisitesCompany;
  set localRequisitesCompany(RequisitosCompanyStruct value) {
    _localRequisitesCompany = value;
    prefs.setString('ff_localRequisitesCompany', value.serialize());
  }

  void updateLocalRequisitesCompanyStruct(
      Function(RequisitosCompanyStruct) updateFn) {
    updateFn(_localRequisitesCompany);
    prefs.setString(
        'ff_localRequisitesCompany', _localRequisitesCompany.serialize());
  }

  bool _filingProfil = false;
  bool get filingProfil => _filingProfil;
  set filingProfil(bool value) {
    _filingProfil = value;
    prefs.setBool('ff_filingProfil', value);
  }

  String _typeUser = '';
  String get typeUser => _typeUser;
  set typeUser(String value) {
    _typeUser = value;
    prefs.setString('ff_typeUser', value);
  }

  int _myID = 0;
  int get myID => _myID;
  set myID(int value) {
    _myID = value;
    prefs.setInt('ff_myID', value);
  }

  int _myCompany = 0;
  int get myCompany => _myCompany;
  set myCompany(int value) {
    _myCompany = value;
    prefs.setInt('ff_myCompany', value);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
    prefs.setString('ff_fcmToken', value);
  }

  /// массив заявок черновиков
  List<AplicationLocalStruct> _localApplicationList = [];
  List<AplicationLocalStruct> get localApplicationList => _localApplicationList;
  set localApplicationList(List<AplicationLocalStruct> value) {
    _localApplicationList = value;
    prefs.setStringList(
        'ff_localApplicationList', value.map((x) => x.serialize()).toList());
  }

  void addToLocalApplicationList(AplicationLocalStruct value) {
    localApplicationList.add(value);
    prefs.setStringList('ff_localApplicationList',
        _localApplicationList.map((x) => x.serialize()).toList());
  }

  void removeFromLocalApplicationList(AplicationLocalStruct value) {
    localApplicationList.remove(value);
    prefs.setStringList('ff_localApplicationList',
        _localApplicationList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLocalApplicationList(int index) {
    localApplicationList.removeAt(index);
    prefs.setStringList('ff_localApplicationList',
        _localApplicationList.map((x) => x.serialize()).toList());
  }

  void updateLocalApplicationListAtIndex(
    int index,
    AplicationLocalStruct Function(AplicationLocalStruct) updateFn,
  ) {
    localApplicationList[index] = updateFn(_localApplicationList[index]);
    prefs.setStringList('ff_localApplicationList',
        _localApplicationList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLocalApplicationList(
      int index, AplicationLocalStruct value) {
    localApplicationList.insert(index, value);
    prefs.setStringList('ff_localApplicationList',
        _localApplicationList.map((x) => x.serialize()).toList());
  }

  /// мои настройки скачанные с супабэйс
  SettingsStruct _mySettings = SettingsStruct();
  SettingsStruct get mySettings => _mySettings;
  set mySettings(SettingsStruct value) {
    _mySettings = value;
    prefs.setString('ff_mySettings', value.serialize());
  }

  void updateMySettingsStruct(Function(SettingsStruct) updateFn) {
    updateFn(_mySettings);
    prefs.setString('ff_mySettings', _mySettings.serialize());
  }

  /// последнее обновление черновиков
  DateTime? _updateDateDraft;
  DateTime? get updateDateDraft => _updateDateDraft;
  set updateDateDraft(DateTime? value) {
    _updateDateDraft = value;
    value != null
        ? prefs.setInt('ff_updateDateDraft', value.millisecondsSinceEpoch)
        : prefs.remove('ff_updateDateDraft');
  }

  /// Последний ID платежа Т-Банка для проверки статуса после возврата в
  /// приложение
  String _lastPaymentId = '';
  String get lastPaymentId => _lastPaymentId;
  set lastPaymentId(String value) {
    _lastPaymentId = value;
    prefs.setString('ff_lastPaymentId', value);
  }

  /// Последний внутренний ID заказа/платежа в нашей системе для резервной
  /// проверки
  String _lastOrderId = '';
  String get lastOrderId => _lastOrderId;
  set lastOrderId(String value) {
    _lastOrderId = value;
    prefs.setString('ff_lastOrderId', value);
  }

  /// Последний тип платежа.
  ///
  /// Например: wallet_topup, order_payment, fine_payment. Используется на
  /// универсальных success/fail страницах для понимания, какой сценарий оплаты
  /// нужно проверить.
  String _lastPaymentPurpose = '';
  String get lastPaymentPurpose => _lastPaymentPurpose;
  set lastPaymentPurpose(String value) {
    _lastPaymentPurpose = value;
    prefs.setString('ff_lastPaymentPurpose', value);
  }

  /// Последний тип сущности, к которой относится платеж.
  ///
  /// Например: wallet, order, fine. Используется для универсальной проверки
  /// платежа после возврата из оплаты.
  String _lastTargetType = '';
  String get lastTargetType => _lastTargetType;
  set lastTargetType(String value) {
    _lastTargetType = value;
    prefs.setString('ff_lastTargetType', value);
  }

  /// Последний id сущности, к которой относится платеж.
  ///
  /// Например id заявки, штрафа или кошелька. Используется для server-side
  /// проверки статуса платежа.
  int _lastTargetId = 0;
  int get lastTargetId => _lastTargetId;
  set lastTargetId(int value) {
    _lastTargetId = value;
    prefs.setInt('ff_lastTargetId', value);
  }

  final _cityListFiltrManager = FutureRequestManager<List<CityRow>>();
  Future<List<CityRow>> cityListFiltr({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CityRow>> Function() requestFn,
  }) =>
      _cityListFiltrManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCityListFiltrCache() => _cityListFiltrManager.clear();
  void clearCityListFiltrCacheKey(String? uniqueKey) =>
      _cityListFiltrManager.clearRequest(uniqueKey);

  final _userManager = FutureRequestManager<List<UserRow>>();
  Future<List<UserRow>> user({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserRow>> Function() requestFn,
  }) =>
      _userManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCache() => _userManager.clear();
  void clearUserCacheKey(String? uniqueKey) =>
      _userManager.clearRequest(uniqueKey);

  final _cityManager = FutureRequestManager<List<CityRow>>();
  Future<List<CityRow>> city({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CityRow>> Function() requestFn,
  }) =>
      _cityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCityCache() => _cityManager.clear();
  void clearCityCacheKey(String? uniqueKey) =>
      _cityManager.clearRequest(uniqueKey);

  final _timeVariableManager = FutureRequestManager<List<TimeVariablyRow>>();
  Future<List<TimeVariablyRow>> timeVariable({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TimeVariablyRow>> Function() requestFn,
  }) =>
      _timeVariableManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTimeVariableCache() => _timeVariableManager.clear();
  void clearTimeVariableCacheKey(String? uniqueKey) =>
      _timeVariableManager.clearRequest(uniqueKey);

  final _realtameNotificationManager =
      StreamRequestManager<List<NotificationsRow>>();
  Stream<List<NotificationsRow>> realtameNotification({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NotificationsRow>> Function() requestFn,
  }) =>
      _realtameNotificationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRealtameNotificationCache() => _realtameNotificationManager.clear();
  void clearRealtameNotificationCacheKey(String? uniqueKey) =>
      _realtameNotificationManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
