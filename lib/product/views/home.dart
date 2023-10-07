// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f_weather/product/extensions/padding_extension.dart';
import 'package:f_weather/product/init/theme/utility/border_radius_manager.dart';
import 'package:f_weather/product/init/theme/utility/padding_manager.dart';
import 'package:f_weather/product/state/home_state_manager.dart';
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
    GetHomeStateManager.homeStateManager.getCurrentCityName().whenComplete(
        () => _weatherViewModel.getWeatherForecastOfCity(GetHomeStateManager.homeStateManager.getCityName));
    super.initState();
  }

  Future<void> refresh() async {
    await _weatherViewModel.getWeatherForecastOfCity(GetHomeStateManager.homeStateManager.getCityName);
  }

  @override
  Widget build(BuildContext context) {
    final sizeOfDevice = MediaQuery.sizeOf(context);

    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: sizeOfDevice.height * 0.70,
            width: sizeOfDevice.width * 0.95,
            child: Column(
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
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: sizeOfDevice.width * 0.02),
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return DailyWeatherForecastCard(sizeOfDevice: sizeOfDevice);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailyWeatherForecastCard extends StatelessWidget {
  const DailyWeatherForecastCard({
    super.key,
    required this.sizeOfDevice,
  });

  final Size sizeOfDevice;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: GetThemeStateManager.themeStateManager.theme.cardTheme.color,
          borderRadius: BorderRadiusManager.commonAllBorderRadius,
        ),
        width: sizeOfDevice.width * 0.25,
        height: sizeOfDevice.height * 0.16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Mon", style: GetThemeStateManager.themeStateManager.theme.textTheme.titleSmall),
            const Icon(WeatherIcons.day_sunny),
            Text(
              "15",
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleSmall,
            ),
            Text(
              "Sunny",
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleSmall,
            ),
          ],
        ),
      );
    });
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
        var sizeOfDevice = MediaQuery.of(context).size;
        var main = _weatherViewModel.weatherForecast.weather?.first.main;
        _weatherViewModel.getWeatherIcon(main: main);

        return !_weatherViewModel.isLoading && main != null
            ? SizedBox(
                width: sizeOfDevice.width,
                height: sizeOfDevice.height * 0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _weatherViewModel.currentWeatherIcon.onlyPadding(right: PaddingManager.onlyRightOfIconOfWeather),
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
    return Observer(builder: (context) {
      return _weatherViewModel.isLoading
          ? const CircularProgressIndicator.adaptive()
          : Text(
              _weatherViewModel.weatherForecast.name ?? "",
              style: GetThemeStateManager.themeStateManager.theme.textTheme.titleLarge,
            );
    });
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
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _weatherViewModel.weatherForecast.main?.temp?.floor().toString() ?? "",
                  style: GetThemeStateManager.themeStateManager.theme.textTheme.titleLarge,
                ),
                const Icon(WeatherIcons.celsius),
              ],
            ).onlyPadding(
              left: PaddingManager.onlyLeftOfTempOfPlace,
              bottom: PaddingManager.onlyBottomOfTempOfPlace,
            ),
    );
  }
}
