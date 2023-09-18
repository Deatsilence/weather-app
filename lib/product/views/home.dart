import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:f_weather/product/viewModels/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_icons/weather_icons.dart';

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
    _weatherViewModel.getWeatherForecastOfCity("iskenderun");
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _LoadingOrWeatherCityName(weatherViewModel: _weatherViewModel),
                const _DescriptionOfCurrentweather(),
                _LoadingOrWeatherTemperature(weatherViewModel: _weatherViewModel),
              ],
            ),
          ),
          const Expanded(
            flex: 3,
            child: Icon(WeatherIcons.cloudy),
          ),
        ],
      ),
    );
  }
}

class _DescriptionOfCurrentweather extends StatelessWidget {
  const _DescriptionOfCurrentweather();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      WeatherIcons.day_sunny,
      size: 100,
    );
  }
}

class _TodaysReportTitle extends StatelessWidget {
  const _TodaysReportTitle();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
    });
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
