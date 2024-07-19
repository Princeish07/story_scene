import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum DioMethod { post, get, put, delete }

class ApiService {
  String get baseUrl {
    if (kDebugMode) {
      return 'http://52.58.73.111/api/api/v1/';
    }
    return 'production url';
  }

  Future<Response> request(String endpoint, DioMethod method,
      {Map<String, dynamic>? param,
        String? contentType,
        formData,
        bool? isAuthenticationRequired,
        String? token}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: isAuthenticationRequired == true
              ? {
            HttpHeaders.authorizationHeader: '$token',
          }
              : null,
        ),
      );

      // Add logging interceptor
      dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (object) {
          if (kDebugMode) {
            print(object);
          }
        },
      ));

      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
