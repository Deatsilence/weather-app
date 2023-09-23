import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_weather/product/models/base_model.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(baseOptions);
  }
  static const String _baseUrl = "http://localhost:8080/weather";
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late Dio _dio;

  Future<dynamic> dioGet<T extends BaseModel>(String city, T model) async {
    final response = await _dio.get("$_baseUrl/$city");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody.cast<String, dynamic>()); //! compute will come here
        }
        return responseBody;
      // case HttpStatus.badRequest
      default:
    }
  }
}
