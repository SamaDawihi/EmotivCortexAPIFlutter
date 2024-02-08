import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QueryHeadsetCall {
  static Future<ApiCallResponse> call({
    String? clientId = 'CkXnClNZKVdp00AN3EsXWwXtWhocR57vkG46NEx0',
    String? clientSecret =
        'uNvvXqglXVktp3nlzN7zNjLragEktCBYRoLVQWfrF0mkC1l3c3Lbnc91gdjRpfgl6tX0VpMKVFq6Q7dknHN4McGxFLu99kLGIy9Mi61R9mGQfK4Nshqbc1M3JjwXoP3W',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'queryHeadset',
      apiUrl: 'wss://localhost:6868',
      callType: ApiCallType.GET,
      headers: {
        'id': '3',
        'jsonrpc': '2.0',
        'method': 'hasAccessRight',
      },
      params: {
        'clientId': clientId,
        'clientSecret': clientSecret,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
