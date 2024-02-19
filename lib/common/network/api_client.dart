import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ismart/common/services/secure_cache.dart';
import 'package:ismart/common/utils/logger.dart';

import 'network.dart';

const String headerAccessToken = 'Authorization';
String baseUrl = "http://192.168.1.105:5000/api/";

abstract class ApiClient {
  Future<dynamic> get(String url,
      {Map<String, String>? addHeaders, Map<String, String>? params});
  Future<dynamic> update(String url,
      {Map<String, String>? headers, Map<String, String>? params});
  Future<dynamic> post(String url, Map<String, dynamic> jsonBody,
      {Map<String, String>? addHeaders, Map<String, String>? params});
}

class ApiClientImpl extends ApiClient with SecureStorageMixin {
  late Dio _dio;

  final headers = <String, String>{'Content-type': 'application/json'};
  ApiClientImpl() {
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 500000000, //5s
        receiveTimeout: 300000000));
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, String>? addHeaders,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(headers: updatedHeaders),
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        log.fine('Connection timeout');
        responseJson = null;
      }
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(
    String url,
    Map<String, dynamic> jsonBody, {
    Map<String, String>? addHeaders,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);

    try {
      final Response response = await _dio.post(
        url,
        queryParameters: params,
        options: Options(headers: updatedHeaders),
        data: jsonBody,
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      log.fine('DioError error e: $e');
    }

    return responseJson;
  }

  @override
  Future<Map<String, dynamic>?> update(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async {
    dynamic responseJson;
    final updatedHeaders = await _setupHeaders(headers);
    try {
      final response = await _dio.put(
        url,
        queryParameters: params,
        options: Options(headers: updatedHeaders),
        data: jsonEncode(params),
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<Map<String, String>> _setupHeaders(
      Map<String, String>? newHeaders) async {
    final updatedHeaders = <String, String>{};

    updatedHeaders.addAll(headers);
    if (newHeaders != null) {
      updatedHeaders.addAll(newHeaders);
    }

    final authToken = await readAuthToken();

    if (authToken != null) {
      updatedHeaders.addAll({headerAccessToken: 'Bearer $authToken'});
    }
    return updatedHeaders;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = response.data;
        log.fine('responseJson $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.data);
      case 401:
      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
