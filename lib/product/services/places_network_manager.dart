import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_weather/product/models/base_model.dart';
import 'package:flutter/material.dart';

class PredictionsNetworkManager {
  PredictionsNetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(baseOptions);
  }
  static const String _apiKey = "AIzaSyDLxC7Pmd77YprxY3hjJQEeJ-LDrVPoAiU";
  static const String _baseUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input";

  static PredictionsNetworkManager? _instance;
  static PredictionsNetworkManager get instance {
    _instance ??= PredictionsNetworkManager._init();
    return _instance!;
  }

  late Dio _dio;

  Future<dynamic> dioGet<T extends BaseModel>(String place, T model) async {
    try {
      final response = await _dio.get("$_baseUrl=$place&key=$_apiKey");

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
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
