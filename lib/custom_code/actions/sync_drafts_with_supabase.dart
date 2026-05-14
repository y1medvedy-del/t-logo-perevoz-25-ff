// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>?> syncDraftsWithSupabase(
  List<AplicationLocalStruct>? appStateListApplication,
  DateTime? localUpdatedAt,
  int? userId,
) async {
  if (userId == null) return null;
  final supabase = Supabase.instance.client;

  // Сериализация локальных черновиков
  final localDraftsJson = appStateListApplication
      ?.map((draft) => {
            'addressStreet': draft.addressStreet,
            'addressHouse': draft.addressHouse,
            'typeCargo': draft.typeCargo,
            'desiretDate': draft.desiretDate,
            'desiretTime': draft.desiretTime,
            'description': draft.description,
            'paymentType': draft.paymentType,
            'declaredWorks':
                draft.declaredWorks?.map((work) => work.toMap()).toList(),
            'cityId': draft.cityId,
            'cityName': draft.cityName,
            'lat': draft.lat,
            'lon': draft.lon,
            'createDate':
                draft.createDate?.toIso8601String(), // сохраняем как есть
            'creatinStage': draft.creatinStage,
            'draft': draft.draft,
            'cityAbriviatyre': draft.cityAbriviatyre,
            'photoList': draft.photoList,
            'videoList': draft.videoList,
            'phoneDriver': draft.phoneDriver,
            'namberCar': draft.namberCar,
            'nameCar': draft.nameCar,
            'surnameDriver': draft.surnameDriver,
            'nameDriver': draft.nameDriver,
            'patronymicDriver': draft.patronymicDriver,
          })
      .toList();

  try {
    print('🔄 Начало синхронизации для пользователя: $userId');
    print('📱 Локальных черновиков: ${appStateListApplication?.length ?? 0}');
    print('📅 Локальная дата обновления: $localUpdatedAt');

    final response = await supabase
        .from('app_state_user')
        .select()
        .eq('user', userId)
        .maybeSingle();

    // Если записи нет - создаем новую
    if (response == null) {
      print('➕ Создаем новую запись в Supabase');
      await supabase.from('app_state_user').insert({
        'user': userId,
        'drawt_list': localDraftsJson ?? [],
        'updated_at_draft': localUpdatedAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
      });
      return null;
    }

    final serverDateString = response['updated_at_draft'] as String?;
    final serverDate =
        serverDateString != null ? DateTime.tryParse(serverDateString) : null;

    final serverDrafts = response['drawt_list'] as List<dynamic>?;

    print('☁️ Серверных черновиков: ${serverDrafts?.length ?? 0}');
    print('📅 Серверная дата обновления: $serverDateString');

    // Логика синхронизации
    if (localUpdatedAt == null) {
      print('⬇️ Возвращаем серверные данные (локальная дата null)');
      return serverDrafts;
    }

    // Простое сравнение дат без преобразования часовых поясов
    if (serverDate == null || localUpdatedAt.isAfter(serverDate)) {
      print('⬆️ Отправляем данные на сервер (локальная версия новее)');
      await supabase.from('app_state_user').update({
        'drawt_list': localDraftsJson ?? [],
        'updated_at_draft': localUpdatedAt.toIso8601String(),
      }).eq('user', userId);
      return null;
    } else {
      print(
          '⬇️ Возвращаем серверные данные (серверная версия новее или равна)');
      return serverDrafts;
    }
  } catch (e) {
    print('❗ Ошибка синхронизации: $e');
    rethrow;
  }
}
