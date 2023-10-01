// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherViewModel on _WeatherViewModelBase, Store {
  Computed<WeatherForecast>? _$weatherForecastComputed;

  @override
  WeatherForecast get weatherForecast => (_$weatherForecastComputed ??=
          Computed<WeatherForecast>(() => super.weatherForecast,
              name: '_WeatherViewModelBase.weatherForecast'))
      .value;
  Computed<Icon>? _$currentWeatherIconComputed;

  @override
  Icon get currentWeatherIcon => (_$currentWeatherIconComputed ??=
          Computed<Icon>(() => super.currentWeatherIcon,
              name: '_WeatherViewModelBase.currentWeatherIcon'))
      .value;

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

  late final _$_currentWeatherIconAtom =
      Atom(name: '_WeatherViewModelBase._currentWeatherIcon', context: context);

  @override
  Icon get _currentWeatherIcon {
    _$_currentWeatherIconAtom.reportRead();
    return super._currentWeatherIcon;
  }

  @override
  set _currentWeatherIcon(Icon value) {
    _$_currentWeatherIconAtom.reportWrite(value, super._currentWeatherIcon, () {
      super._currentWeatherIcon = value;
    });
  }

  late final _$_weatherForecastAtom =
      Atom(name: '_WeatherViewModelBase._weatherForecast', context: context);

  @override
  WeatherForecast get _weatherForecast {
    _$_weatherForecastAtom.reportRead();
    return super._weatherForecast;
  }

  @override
  set _weatherForecast(WeatherForecast value) {
    _$_weatherForecastAtom.reportWrite(value, super._weatherForecast, () {
      super._weatherForecast = value;
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
  dynamic getWeatherIcon({String? main}) {
    final _$actionInfo = _$_WeatherViewModelBaseActionController.startAction(
        name: '_WeatherViewModelBase.getWeatherIcon');
    try {
      return super.getWeatherIcon(main: main);
    } finally {
      _$_WeatherViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
weatherForecast: ${weatherForecast},
currentWeatherIcon: ${currentWeatherIcon}
    ''';
  }
}
