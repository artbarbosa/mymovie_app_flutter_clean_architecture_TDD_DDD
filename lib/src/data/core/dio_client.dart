import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mymovie_app/src/data/core/api_client_interface.dart';
import 'package:mymovie_app/src/data/core/api_consts.dart';

import 'unathorised_exception.dart';

class DioClient implements IApiClient {
  final Dio _client;

  DioClient(this._client);

  @override
  Future get(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final response = await _client.get(path,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ));
    if (response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      return throw Exception(response.statusMessage);
    }
  }

  @override
  Future post(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(path,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    if (response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  Future deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    RequestOptions request = RequestOptions(
        path: path,
        method: 'DELETE',
        data: jsonEncode(params),
        headers: {'Content-Type': 'application/json'});
    final response = await _client.fetch(request);

    if (response.statusCode == 200) {
      return json.encode(response.data);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  Future getPath(String path, Map<dynamic, dynamic>? params) async {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
