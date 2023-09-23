import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/models/weather_forecast_model.dart';
import 'package:f_weather/product/services/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_icons/weather_icons.dart';
part 'weather_forecast_view_model.g.dart';

class WeatherViewModel = _WeatherViewModelBase with _$WeatherViewModel;

abstract class _WeatherViewModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Icon _currentWeatherIcon = const Icon(WeatherIcons.day_sunny, size: 100);

  @observable
  WeatherForecast _weatherForecast = WeatherForecast();

  @computed
  WeatherForecast get weatherForecast => _weatherForecast;

  @computed
  Icon get currentWeatherIcon => _currentWeatherIcon;

  @action
  Future<void> getWeatherForecastOfCity(String cityName) async {
    changeLoading();
    final response = await NetworkManager.instance.dioGet<WeatherForecast>(cityName, WeatherForecast());
    if (response is WeatherForecast) {
      _weatherForecast = response;
    }
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  getWeatherIcon({String? main}) {
    switch (main) {
      case TextManager.textClear:
        _currentWeatherIcon = const Icon(WeatherIcons.day_sunny, size: 100);
        break;
      case TextManager.textClouds:
        _currentWeatherIcon = const Icon(WeatherIcons.day_cloudy, size: 100);
        break;
      case TextManager.textThunderstorm:
        _currentWeatherIcon = const Icon(WeatherIcons.thunderstorm, size: 100);
        break;
      case TextManager.textDrizzle:
        _currentWeatherIcon = const Icon(WeatherIcons.raindrop, size: 100);
        break;
      case TextManager.textRain:
        _currentWeatherIcon = const Icon(WeatherIcons.day_rain, size: 100);
        break;
      case TextManager.textSnow:
        _currentWeatherIcon = const Icon(WeatherIcons.day_snow, size: 100);
        break;
      case TextManager.textMist:
        _currentWeatherIcon = const Icon(WeatherIcons.day_fog, size: 100);
        break;
      case TextManager.textSmoke:
        _currentWeatherIcon = const Icon(WeatherIcons.smoke, size: 100);
        break;
      case TextManager.textHaze:
        _currentWeatherIcon = const Icon(WeatherIcons.day_haze, size: 100);
        break;
      case TextManager.textFog:
        _currentWeatherIcon = const Icon(WeatherIcons.day_fog, size: 100);
        break;
      case TextManager.textSand:
        _currentWeatherIcon = const Icon(WeatherIcons.sandstorm, size: 100);
        break;
      case TextManager.textAsh:
        _currentWeatherIcon = const Icon(WeatherIcons.dust, size: 100);
        break;
      case TextManager.textSquall:
        _currentWeatherIcon = const Icon(WeatherIcons.dust, size: 100);
        break;
      case TextManager.textTornado:
        _currentWeatherIcon = const Icon(WeatherIcons.tornado, size: 100);
        break;
      default:
        _currentWeatherIcon = const Icon(WeatherIcons.day_sunny, size: 100);
        break;
    }
  }
}
  // static const String textThunderstorm = "Thunderstorm";
  // static const String textDrizzle = "Drizzle";
  // static const String textRain = "Rain";
  // static const String textSnow = "Snow";
  // static const String textMist = "Mist";
  // static const String textSmoke = "Smoke";
  // static const String textHaze = "Haze";
  // static const String textDust = "Haze";
  // static const String textFog = "Fog";
  // static const String textSand = "Sand";
  // static const String textAsh = "Ash";
  // static const String textSquall = "Squall";
  // static const String textTornado = "Tornado";
  // static const String textClear = "Clear";
  // static const String textClouds = "Clouds";