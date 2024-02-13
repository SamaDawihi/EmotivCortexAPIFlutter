import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetImgIdCall {
  static Future<ApiCallResponse> call({
    String? prompt =
        'a 21 year old arabian female, with medium skin color, black hair and black eyes, who seems to be feeling sad.',
  }) async {
    final ffApiRequestBody = '''
{
  "version": "39ed52f2a78e934b3ba6e2a89f5b1c712de7dfea535525255b1aa35c5565e08b",
  "input": {
    "prompt": "$prompt"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getImgId',
      apiUrl: 'https://api.replicate.com/v1/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class GetImgCall {
  static Future<ApiCallResponse> call({
    String? id = 'dlxoyidbofi5xlxq5jzxfoqpzq',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getImg',
      apiUrl: 'https://api.replicate.com/v1/predictions/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? imagePath(dynamic response) => getJsonField(
        response,
        r'''$.output''',
        true,
      ) as List?;
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
