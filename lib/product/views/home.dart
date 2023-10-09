// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f_weather/product/extensions/days_extension.dart';
import 'package:f_weather/product/utility/days_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:f_weather/product/constants/texts/text_manager.dart';
import 'package:f_weather/product/extensions/padding_extension.dart';
import 'package:f_weather/product/init/theme/utility/border_radius_manager.dart';
import 'package:f_weather/product/init/theme/utility/padding_manager.dart';
import 'package:f_weather/product/state/home_state_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:f_weather/product/viewModels/weather_forecast_view_model.dart';

bool _isOpen = false;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weatherViewModel = WeatherViewModel();

  @override
  void initState() {
    _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    if (_isOpen) {
      await _weatherViewModel
          .getWeatherForecastOfCity(GetHomeStateManager.homeStateManager.getCityName)
          .whenComplete(() => GetHomeStateManager.homeStateManager.getSelectedPosition(
              _weatherViewModel.weatherForecast.coord!.lat ?? 0, _weatherViewModel.weatherForecast.coord!.lon ?? 0))
          .whenComplete(() => _weatherViewModel.getWeaklyWeatherForecastOfCity(
              GetHomeStateManager.homeStateManager.getLat, GetHomeStateManager.homeStateManager.getLon));
    } else {
      await GetHomeStateManager.homeStateManager
          .getCurrentPosition()
          .whenComplete(
            () => _weatherViewModel.getWeaklyWeatherForecastOfCity(
                GetHomeStateManager.homeStateManager.getLat, GetHomeStateManager.homeStateManager.getLon),
          )
          .whenComplete(() => GetHomeStateManager.homeStateManager.getCurrentCityName().whenComplete(
              () => _weatherViewModel.getWeatherForecastOfCity(GetHomeStateManager.homeStateManager.getCityName)));
    }
    _isOpen = true;
  }

  Future<void> refresh() async {
    await _weatherViewModel.getWeatherForecastOfCity(GetHomeStateManager.homeStateManager.getCityName);
    await _weatherViewModel.getWeaklyWeatherForecastOfCity(
        GetHomeStateManager.homeStateManager.getLat, GetHomeStateManager.homeStateManager.getLon);
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
                _WeaklyForecastRow(
                  sizeOfDevice: sizeOfDevice,
                  weatherViewModel: _weatherViewModel,
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
    Key? key,
    required this.sizeOfDevice,
    required this.dayName,
    required this.temp,
    required this.description,
    required this.icon,
  }) : super(key: key);

  final Size sizeOfDevice;
  final String dayName;
  final String temp;
  final String description;
  final Icon icon;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Text(dayName, style: GetThemeStateManager.themeStateManager.theme.textTheme.titleSmall)),
            Expanded(flex: 1, child: icon),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    temp,
                    style: GetThemeStateManager.themeStateManager.theme.textTheme.titleSmall,
                  ),
                  const Icon(WeatherIcons.celsius).onlyPadding(
                    bottom: PaddingManager.onlyBottomOfTempOfPlace,
                  ),
                ],
              ).onlyPadding(
                left: PaddingManager.onlyLeftOfTempOfPlace,
                bottom: PaddingManager.onlyBottomOfTempOfPlace,
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  description,
                  style: GetThemeStateManager.themeStateManager.theme.textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _WeaklyForecastRow extends StatelessWidget {
  final WeatherViewModel _weatherViewModel;
  final Size sizeOfDevice;

  const _WeaklyForecastRow({
    Key? key,
    required WeatherViewModel weatherViewModel,
    required this.sizeOfDevice,
  })  : _weatherViewModel = weatherViewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Expanded(
          flex: 3,
          child: _weatherViewModel.isLoading || _weatherViewModel.isLoadingRow
              ? const CircularProgressIndicator.adaptive()
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: sizeOfDevice.width * 0.02),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    var model = _weatherViewModel.weaklyForecast.list?[index * 5];
                    var main = _weatherViewModel.weaklyForecast.list?[index * 5].weather?.first.main;
                    var nameOfDay = DaysUtility().daysList[index];

                    _weatherViewModel.getWeatherIcon(main: main, size: 20);

                    return DailyWeatherForecastCard(
                      dayName: nameOfDay,
                      description: model?.weather?.first.description?.toString() ?? "",
                      temp: model?.main?.temp?.floor().toString() ?? "",
                      sizeOfDevice: sizeOfDevice,
                      icon: _weatherViewModel.currentWeatherIcon,
                    );
                  },
                ),
        );
      },
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
