// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// список всех настроек которые обновляются при входе в приложение
class SettingsStruct extends BaseStruct {
  SettingsStruct({
    /// колличество дней для скрытия контактов пользователей
    int? daysToHideContacts,

    /// Скрытие баннера
    bool? hideBanner,
  })  : _daysToHideContacts = daysToHideContacts,
        _hideBanner = hideBanner;

  // "days_to_hide_contacts" field.
  int? _daysToHideContacts;
  int get daysToHideContacts => _daysToHideContacts ?? 0;
  set daysToHideContacts(int? val) => _daysToHideContacts = val;

  void incrementDaysToHideContacts(int amount) =>
      daysToHideContacts = daysToHideContacts + amount;

  bool hasDaysToHideContacts() => _daysToHideContacts != null;

  // "hideBanner" field.
  bool? _hideBanner;
  bool get hideBanner => _hideBanner ?? false;
  set hideBanner(bool? val) => _hideBanner = val;

  bool hasHideBanner() => _hideBanner != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        daysToHideContacts: castToType<int>(data['days_to_hide_contacts']),
        hideBanner: data['hideBanner'] as bool?,
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SettingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'days_to_hide_contacts': _daysToHideContacts,
        'hideBanner': _hideBanner,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days_to_hide_contacts': serializeParam(
          _daysToHideContacts,
          ParamType.int,
        ),
        'hideBanner': serializeParam(
          _hideBanner,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        daysToHideContacts: deserializeParam(
          data['days_to_hide_contacts'],
          ParamType.int,
          false,
        ),
        hideBanner: deserializeParam(
          data['hideBanner'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsStruct &&
        daysToHideContacts == other.daysToHideContacts &&
        hideBanner == other.hideBanner;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([daysToHideContacts, hideBanner]);
}

SettingsStruct createSettingsStruct({
  int? daysToHideContacts,
  bool? hideBanner,
}) =>
    SettingsStruct(
      daysToHideContacts: daysToHideContacts,
      hideBanner: hideBanner,
    );
