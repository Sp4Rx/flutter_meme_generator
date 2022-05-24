import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meme_generator/core/exceptions/ApiException.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient.internal();
  static Dio? _dio;

  ApiClient.internal() {
    _dio = Dio(BaseOptions(connectTimeout: 10000));
  }

  factory ApiClient() => _instance;

  Future<dynamic> get(String url) async {
    try {
      Response? response = await _dio?.get(url);
      final data = response?.data;
      return data;
    } on DioError catch (error) {
      _handleError(error);
    } catch (error) {
      _handleError(
        DioError(
          requestOptions: RequestOptions(
            path: url,
            method: 'GET',
          ),
        ),
      );
    }
  }

  Future<dynamic> post(String url, {body}) async {
    try {
      Response? response = await _dio?.post(url, data: body);
      final data = response?.data;
      return data;
    } on DioError catch (error) {
      _handleError(error);
    } catch (error) {
      _handleError(
        DioError(
          requestOptions: RequestOptions(
            path: url,
            method: 'POST',
          ),
        ),
      );
    }
  }

  void _handleError(DioError error) {
    final method = error.requestOptions.method;
    final response = error.response;

    if (response != null) {
      final data = response.data;
      final int? statusCode = response.statusCode;

      throw ApiException(
          tag: 'api_client',
          apiUrl: error.requestOptions.path,
          errorMessageFromApp:
              'received server error $statusCode while $method data',
          responseReceived: data.toString(),
          statusCode: statusCode);
    } else {
      int errorCode = 0; //We will send a default error code as 0

      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        errorCode = HttpStatus
            .requestTimeout; //Set the error code to 408 in case of timeout
      }

      throw ApiException(
        tag: 'api_client',
        apiUrl: error.requestOptions.path,
        errorMessageFromApp: 'received server error while $method data',
        responseReceived: error.message,
        statusCode: errorCode,
      );
    }
  }
}
