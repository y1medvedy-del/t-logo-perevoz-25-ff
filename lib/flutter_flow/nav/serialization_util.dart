import 'dart:convert';

import 'package:flutter/material.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeToString(DateTime dateTime) =>
    '${dateTime.isUtc ? 'u' : 'l'}${dateTime.millisecondsSinceEpoch}';

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final start = dateTimeRange.start;
  final end = dateTimeRange.end;
  final startStr = '${start.isUtc ? 'u' : 'l'}${start.millisecondsSinceEpoch}';
  final endStr = '${end.isUtc ? 'u' : 'l'}${end.millisecondsSinceEpoch}';
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = dateTimeToString(param as DateTime);
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);

      case ParamType.DataStruct:
        data = param is BaseStruct ? param.serialize() : null;

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTime? dateTimeFromString(String? dateTimeStr) {
  if (dateTimeStr == null || dateTimeStr.isEmpty) {
    return null;
  }
  final hasPrefix = dateTimeStr.startsWith('u') || dateTimeStr.startsWith('l');
  final milliseconds = int.tryParse(
    hasPrefix ? dateTimeStr.substring(1) : dateTimeStr,
  );
  return milliseconds != null
      ? DateTime.fromMillisecondsSinceEpoch(
          milliseconds,
          isUtc: hasPrefix ? dateTimeStr.startsWith('u') : false,
        )
      : null;
}

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  DateTime? parseDateTime(String value) {
    final hasPrefix = value.startsWith('u') || value.startsWith('l');
    final milliseconds = int.tryParse(hasPrefix ? value.substring(1) : value);
    return milliseconds != null
        ? DateTime.fromMillisecondsSinceEpoch(
            milliseconds,
            isUtc: hasPrefix ? value.startsWith('u') : false,
          )
        : null;
  }

  final start = parseDateTime(pieces.first);
  final end = parseDateTime(pieces.last);
  if (start == null || end == null) {
    return null;
  }
  return DateTimeRange(
    start: start,
    end: end,
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  DataStruct,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        return dateTimeFromString(param);
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case ActWorkRow:
            return ActWorkRow(data);
          case FineRow:
            return FineRow(data);
          case ReplaceOutputInvoiceRow:
            return ReplaceOutputInvoiceRow(data);
          case TopicsSupportRow:
            return TopicsSupportRow(data);
          case ApplicationWithUsersRow:
            return ApplicationWithUsersRow(data);
          case FeedBackUserRow:
            return FeedBackUserRow(data);
          case WalletsRow:
            return WalletsRow(data);
          case CommissionForTheWarehouseRow:
            return CommissionForTheWarehouseRow(data);
          case ApplicationDetailsRow:
            return ApplicationDetailsRow(data);
          case ComplaintRow:
            return ComplaintRow(data);
          case TypeCompanyRow:
            return TypeCompanyRow(data);
          case NdsRow:
            return NdsRow(data);
          case CarsRow:
            return CarsRow(data);
          case DraftApplicationRow:
            return DraftApplicationRow(data);
          case AppStateUserRow:
            return AppStateUserRow(data);
          case FilterUserCityRow:
            return FilterUserCityRow(data);
          case ChatWithUserAndApplicationInfoRow:
            return ChatWithUserAndApplicationInfoRow(data);
          case FunctionExecutionLogRow:
            return FunctionExecutionLogRow(data);
          case TypeCargoRow:
            return TypeCargoRow(data);
          case CommissionListRow:
            return CommissionListRow(data);
          case PaymentInvoiceWithActLinkRow:
            return PaymentInvoiceWithActLinkRow(data);
          case ContractTemplatesRow:
            return ContractTemplatesRow(data);
          case PaymentInvoiceDetailedRow:
            return PaymentInvoiceDetailedRow(data);
          case ProfilesRow:
            return ProfilesRow(data);
          case ReplaceOutputCompanyRow:
            return ReplaceOutputCompanyRow(data);
          case TimeVariablyRow:
            return TimeVariablyRow(data);
          case ChatRow:
            return ChatRow(data);
          case AplicationRow:
            return AplicationRow(data);
          case CityRequestRow:
            return CityRequestRow(data);
          case SettingsRow:
            return SettingsRow(data);
          case TransactionsRow:
            return TransactionsRow(data);
          case ReasonRefusalRow:
            return ReasonRefusalRow(data);
          case FeedBackViewRow:
            return FeedBackViewRow(data);
          case OnlinePaymentsRow:
            return OnlinePaymentsRow(data);
          case UserPushTokensRow:
            return UserPushTokensRow(data);
          case WorkAnswerRow:
            return WorkAnswerRow(data);
          case ContractClausesRow:
            return ContractClausesRow(data);
          case FeedBackRow:
            return FeedBackRow(data);
          case ApplicationContentRow:
            return ApplicationContentRow(data);
          case UpdDebugLogRow:
            return UpdDebugLogRow(data);
          case ComplaintReasonsRow:
            return ComplaintReasonsRow(data);
          case WorksApplicationRow:
            return WorksApplicationRow(data);
          case InfoAplicationcRow:
            return InfoAplicationcRow(data);
          case WarehouseRow:
            return WarehouseRow(data);
          case AnswerContentRow:
            return AnswerContentRow(data);
          case FineApplicationUserViewRow:
            return FineApplicationUserViewRow(data);
          case PositionsRow:
            return PositionsRow(data);
          case DocumentRow:
            return DocumentRow(data);
          case PaymentInvoiceRow:
            return PaymentInvoiceRow(data);
          case DriversRow:
            return DriversRow(data);
          case UpdJobsRow:
            return UpdJobsRow(data);
          case ReviewsContentRow:
            return ReviewsContentRow(data);
          case QuestionsSupportRow:
            return QuestionsSupportRow(data);
          case ApplicationBlancDocRow:
            return ApplicationBlancDocRow(data);
          case ComplaintUserRow:
            return ComplaintUserRow(data);
          case AplicationNameCompanyRow:
            return AplicationNameCompanyRow(data);
          case OfferRulesRow:
            return OfferRulesRow(data);
          case SupportAnswerDocRow:
            return SupportAnswerDocRow(data);
          case DocumentContractCompanyNameRow:
            return DocumentContractCompanyNameRow(data);
          case BannerRow:
            return BannerRow(data);
          case WorksRow:
            return WorksRow(data);
          case PremiumSubscriptionRow:
            return PremiumSubscriptionRow(data);
          case SupportAnswerTextRow:
            return SupportAnswerTextRow(data);
          case DayRow:
            return DayRow(data);
          case ApplicationWalletViewRow:
            return ApplicationWalletViewRow(data);
          case SupportAnswerRow:
            return SupportAnswerRow(data);
          case ApplicationPaymentProfitRow:
            return ApplicationPaymentProfitRow(data);
          case MessageRow:
            return MessageRow(data);
          case AnswerRow:
            return AnswerRow(data);
          case CompanyRow:
            return CompanyRow(data);
          case UserRow:
            return UserRow(data);
          case ActWorkWithCompaniesRow:
            return ActWorkWithCompaniesRow(data);
          case MarkupPraceRow:
            return MarkupPraceRow(data);
          case DocumentContractRow:
            return DocumentContractRow(data);
          case NotificationAdminRow:
            return NotificationAdminRow(data);
          case SmsLogsRow:
            return SmsLogsRow(data);
          case TypePaymentRow:
            return TypePaymentRow(data);
          case UserWarehouseRow:
            return UserWarehouseRow(data);
          case FinePaymentRow:
            return FinePaymentRow(data);
          case DraftContentRow:
            return DraftContentRow(data);
          case PushLogsRow:
            return PushLogsRow(data);
          case ClientContractDataRow:
            return ClientContractDataRow(data);
          case CityRow:
            return CityRow(data);
          case ReplaceOutputRow:
            return ReplaceOutputRow(data);
          case ReviewsRow:
            return ReviewsRow(data);
          case MarkupPraceListRow:
            return MarkupPraceListRow(data);
          case NotificationsRow:
            return NotificationsRow(data);
          default:
            return null;
        }

      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
