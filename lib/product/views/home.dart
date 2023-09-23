// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f_weather/product/extensions/seperate_for_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:f_weather/product/viewModels/weather_forecast_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weatherViewModel = WeatherViewModel();

  @override
  void initState() {
    super.initState();
    _weatherViewModel.getWeatherForecastOfCity("Ankara");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Home build");

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _TodaysReportTitle(),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _LoadingOrWeatherCityName(weatherViewModel: _weatherViewModel),
                _LoadingOrDescriptionOfCurrentweather(weatherViewModel: _weatherViewModel),
                _LoadingOrWeatherTemperature(weatherViewModel: _weatherViewModel),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Icon(WeatherIcons.cloudy),
                const Icon(WeatherIcons.cloudy),
                const Icon(WeatherIcons.cloudy),
              ].seperate(space: 20, direction: Axis.horizontal),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingOrDescriptionOfCurrentweather extends StatelessWidget {
  final WeatherViewModel _weatherViewModel;

  const _LoadingOrDescriptionOfCurrentweather({
    Key? key,
    required WeatherViewModel weatherViewModel,
  })  : _weatherViewModel = weatherViewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        var sizeOfDevice = MediaQuery.sizeOf(context);
        var main = _weatherViewModel.weatherForecast.weather?.first.main;
        _weatherViewModel.getWeatherIcon(main: main);

        return !_weatherViewModel.isLoading && main != null
            ? SizedBox(
                width: sizeOfDevice.width * 0.5,
                height: sizeOfDevice.height * 0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _weatherViewModel.currentWeatherIcon,
                    Text(
                      main,
                      style: GetThemeStateManager.themeStateManager.theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator.adaptive();
      },
    );
  }
}

class _TodaysReportTitle extends StatelessWidget {
  const _TodaysReportTitle();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              TextManager.textTodaysReport,
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}

class _LoadingOrWeatherCityName extends StatelessWidget {
  final WeatherViewModel _weatherViewModel;

  const _LoadingOrWeatherCityName({
    Key? key,
    required WeatherViewModel weatherViewModel,
  })  : _weatherViewModel = weatherViewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("CityName: ${_weatherViewModel.weatherForecast.name}");
    return Observer(
      builder: (context) => _weatherViewModel.isLoading
          ? const CircularProgressIndicator.adaptive()
          : Text(
              _weatherViewModel.weatherForecast.name ?? "unknown",
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleLarge,
            ),
    );
  }
}

class _LoadingOrWeatherTemperature extends StatelessWidget {
  final WeatherViewModel _weatherViewModel;

  const _LoadingOrWeatherTemperature({
    Key? key,
    required WeatherViewModel weatherViewModel,
  })  : _weatherViewModel = weatherViewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => _weatherViewModel.isLoading
          ? const CircularProgressIndicator.adaptive()
          : Text(
              _weatherViewModel.weatherForecast.main?.temp?.floor().toString() ?? "unknown",
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleLarge,
            ),
    );
  }
}
