import 'package:f_weather/product/constants/enums/end_enum.dart';
import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/extensions/end_extension.dart';
import 'package:f_weather/product/models/weakly_forecast_model.dart';
import 'package:f_weather/product/models/weather_forecast_model.dart';
import 'package:f_weather/product/services/weather_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_icons/weather_icons.dart';
part 'weather_forecast_view_model.g.dart';

class WeatherViewModel = _WeatherViewModelBase with _$WeatherViewModel;

abstract class _WeatherViewModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoadingRow = false;

  @observable
  Icon _currentWeatherIcon = const Icon(WeatherIcons.day_sunny, size: 100);

  @observable
  WeatherForecast _weatherForecast = WeatherForecast();

  @observable
  WeaklyForecast _weaklyForecast = WeaklyForecast();

  @computed
  WeaklyForecast get weaklyForecast => _weaklyForecast;

  @computed
  WeatherForecast get weatherForecast => _weatherForecast;

  @computed
  Icon get currentWeatherIcon => _currentWeatherIcon;

  @action
  Future<void> getWeatherForecastOfCity(String cityName) async {
    changeLoading();
    final response = await WeatherNetworkManager.instance.dioGet<WeatherForecast>(
      end: End.weather.rawValue,
      queryParameters: {"name": cityName},
      model: WeatherForecast(),
    );
    if (response is WeatherForecast) {
      _weatherForecast = response;
    }

    changeLoading();
  }

  @action
  Future<void> getWeaklyWeatherForecastOfCity(double lat, double lon) async {
    changeLoadingRow();
    final response = await WeatherNetworkManager.instance.dioGet<WeaklyForecast>(
      end: End.forecast.rawValue,
      queryParameters: {
        "lat": lat,
        "lon": lon,
      },
      model: WeaklyForecast(),
    );
    if (response is WeaklyForecast) {
      _weaklyForecast = response;
    }

    changeLoadingRow();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void changeLoadingRow() {
    isLoadingRow = !isLoadingRow;
  }

  @action
  getWeatherIcon({String? main, double size = 100}) {
    switch (main) {
      case TextManager.textClear:
        _currentWeatherIcon = Icon(WeatherIcons.day_sunny, size: size);
        break;
      case TextManager.textClouds:
        _currentWeatherIcon = Icon(WeatherIcons.day_cloudy, size: size);
        break;
      case TextManager.textThunderstorm:
        _currentWeatherIcon = Icon(WeatherIcons.thunderstorm, size: size);
        break;
      case TextManager.textDrizzle:
        _currentWeatherIcon = Icon(WeatherIcons.raindrop, size: size);
        break;
      case TextManager.textRain:
        _currentWeatherIcon = Icon(WeatherIcons.day_rain, size: size);
        break;
      case TextManager.textSnow:
        _currentWeatherIcon = Icon(WeatherIcons.day_snow, size: size);
        break;
      case TextManager.textMist:
        _currentWeatherIcon = Icon(WeatherIcons.day_fog, size: size);
        break;
      case TextManager.textSmoke:
        _currentWeatherIcon = Icon(WeatherIcons.smoke, size: size);
        break;
      case TextManager.textHaze:
        _currentWeatherIcon = Icon(WeatherIcons.day_haze, size: size);
        break;
      case TextManager.textFog:
        _currentWeatherIcon = Icon(WeatherIcons.day_fog, size: size);
        break;
      case TextManager.textSand:
        _currentWeatherIcon = Icon(WeatherIcons.sandstorm, size: size);
        break;
      case TextManager.textAsh:
        _currentWeatherIcon = Icon(WeatherIcons.dust, size: size);
        break;
      case TextManager.textSquall:
        _currentWeatherIcon = Icon(WeatherIcons.dust, size: size);
        break;
      case TextManager.textTornado:
        _currentWeatherIcon = Icon(WeatherIcons.tornado, size: size);
        break;
      default:
        _currentWeatherIcon = Icon(WeatherIcons.day_sunny, size: size);
        break;
    }
  }
}

class GetWeatherViewModelManager {
  static final WeatherViewModel weatherViewModel = WeatherViewModel();
}
