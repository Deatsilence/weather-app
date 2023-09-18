import 'package:f_weather/product/models/weather_forecast_model.dart';
import 'package:f_weather/product/services/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'weather_view_model.g.dart';

class WeatherViewModel = _WeatherViewModelBase with _$WeatherViewModel;

abstract class _WeatherViewModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String cityName = "";

  @observable
  WeatherForecast weatherForecast = WeatherForecast();

  @action
  Future<void> getWeatherForecastOfCity(String cityName) async {
    changeLoading();
    final response = await NetworkManager.instance.dioGet<WeatherForecast>(cityName, WeatherForecast());
    if (response is WeatherForecast) {
      weatherForecast = response;
    }
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
