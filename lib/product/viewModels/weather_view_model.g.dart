// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherViewModel on _WeatherViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_WeatherViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: '_WeatherViewModelBase.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  late final _$weatherForecastAtom =
      Atom(name: '_WeatherViewModelBase.weatherForecast', context: context);

  @override
  WeatherForecast get weatherForecast {
    _$weatherForecastAtom.reportRead();
    return super.weatherForecast;
  }

  @override
  set weatherForecast(WeatherForecast value) {
    _$weatherForecastAtom.reportWrite(value, super.weatherForecast, () {
      super.weatherForecast = value;
    });
  }

  late final _$getWeatherForecastOfCityAsyncAction = AsyncAction(
      '_WeatherViewModelBase.getWeatherForecastOfCity',
      context: context);

  @override
  Future<void> getWeatherForecastOfCity(String cityName) {
    return _$getWeatherForecastOfCityAsyncAction
        .run(() => super.getWeatherForecastOfCity(cityName));
  }

  late final _$_WeatherViewModelBaseActionController =
      ActionController(name: '_WeatherViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_WeatherViewModelBaseActionController.startAction(
        name: '_WeatherViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_WeatherViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
cityName: ${cityName},
weatherForecast: ${weatherForecast}
    ''';
  }
}
