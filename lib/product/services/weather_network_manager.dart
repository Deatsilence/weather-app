import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_weather/product/models/base_model.dart';
import 'package:flutter/material.dart';

class WeatherNetworkManager {
  WeatherNetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(baseOptions);
  }
  static const String _baseUrl = "http://localhost:8080";
  static WeatherNetworkManager? _instance;
  static WeatherNetworkManager get instance {
    _instance ??= WeatherNetworkManager._init();
    return _instance!;
  }

  late Dio _dio;

  Future<dynamic> dioGet<T extends BaseModel>(
      {String end = "/weather", Map<String, dynamic>? queryParameters, T? model}) async {
    try {
      final response = await _dio.get(
        "$_baseUrl$end",
        queryParameters: queryParameters,
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (responseBody is List && model != null) {
            return responseBody.map((e) => model.fromJson(e)).toList();
          } else if (responseBody is Map && model != null) {
            return model.fromJson(responseBody.cast<String, dynamic>()); //! compute will come here
          }

          return responseBody;
        // case HttpStatus.badRequest
        default:
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
