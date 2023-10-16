// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_weather/product/models/places_model.dart';
import 'package:f_weather/product/models/weakly_forecast_model.dart';
import 'package:f_weather/product/models/weather_forecast_model.dart';
import 'package:f_weather/product/services/places_network_manager.dart';
import 'package:f_weather/product/services/weather_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dioGet should return a WeatherForecast', () async {
    final networkManager = WeatherNetworkManager.instance;
    final response = await networkManager.dioGet<WeatherForecast>(
      end: '/weather',
      queryParameters: {'name': 'Ankara'},
    );

    // response, WeatherForecast tipinde bir nesne olmalıdır
    expect(response, isNotNull);
  });

  test('dioGet should return a WeaklyForecast', () async {
    final networkManager = WeatherNetworkManager.instance;
    final response = await networkManager.dioGet<WeaklyForecast>(
      end: '/forecast',
      queryParameters: {
        "lat": 39.9199,
        "lon": 32.8543,
      },
    );

    // response, WeatherForecast tipinde bir nesne olmalıdır
    expect(response, isNotNull);
  });

  test('dioGet should return a Place', () async {
    final networkManager = PredictionsNetworkManager.instance;
    final response = await networkManager.dioGet<Places>('Ankara', Places());

    // response, WeatherForecast tipinde bir nesne olmalıdır
    expect(response, isNotNull);
  });
}
