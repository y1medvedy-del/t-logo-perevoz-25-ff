import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AddressCarrierTextFildCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    int? datafiasLevel = 8,
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${query}",
  "data.fias_level": ${datafiasLevel}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addressCarrierTextFild',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token b0f8caaff6e43de3f942ee7855360a6e65998bf8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? typeHouse(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? namberHouse(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? suggestion(dynamic response) => getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?;
  static List<String>? street(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.street_with_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lon(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddressLatLongCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lon,
  }) async {
    final ffApiRequestBody = '''
{
  "lat": ${lat},
  "lon": ${lon},
  "radius_metrs": <radius_meters>,
  "count": <count>
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addressLatLong',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token 0aa05315e52d1617a20c2dff2aa8b8a3b2649658',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? typeStreet(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.street_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nameStreet(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.street''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? typeHouse(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? numberHouse(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? suggestion(dynamic response) => getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?;
  static List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestCompanyCall {
  static Future<ApiCallResponse> call({
    String? inn = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${inn}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'requestCompany',
      apiUrl: 'suggestions.dadata.ru/suggestions/api/4_1/rs/findById/party',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token b0f8caaff6e43de3f942ee7855360a6e65998bf8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? ogrn(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[0].data.ogrn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? addressCompany(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].data.address.value''',
      ));
  static String? kppCompany(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].data.kpp''',
      ));
  static String? okpoCompany(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].data.okpo''',
      ));
  static String? okvedCompany(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].data.okved''',
      ));
  static List<String>? typeCompany(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[0].data.opf.short''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nameCompany(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BikBankCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "${query}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bikBank',
      apiUrl: 'suggestions.dadata.ru/suggestions/api/4_1/rs/findById/bank',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token b0f8caaff6e43de3f942ee7855360a6e65998bf8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? nameBank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].value''',
      ));
  static String? korespondentScore(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.suggestions[0].data.correspondent_account''',
      ));
}

class GeoCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lon,
    int? radiusMeters = 1000,
  }) async {
    final ffApiRequestBody = '''
{
  "lat": ${lat},
  "lon": ${lon},
  "radius_meters": ${radiusMeters}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geo',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token 0aa05315e52d1617a20c2dff2aa8b8a3b2649658',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? value(dynamic response) => getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?;
  static List<String>? street(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.street_with_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? typeHouse(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? house(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.house''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lon(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? city(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
