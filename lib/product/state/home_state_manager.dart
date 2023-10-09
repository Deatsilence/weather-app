import 'package:f_weather/product/init/mixin/location_mixin.dart';
import 'package:mobx/mobx.dart';
part 'home_state_manager.g.dart';

class HomeStateManager = HomeStateManagerBase with _$HomeStateManager;

abstract class HomeStateManagerBase with Store {
  @observable
  String _cityName = "";

  @observable
  double _lat = 0.0;

  @observable
  double _lon = 0.0;

  @computed
  String get getCityName => _cityName;

  @computed
  double get getLat => _lat;

  @computed
  double get getLon => _lon;

  @action
  void setCityName(String name) {
    _cityName = name;
  }

  @action
  void setPosition(double lat, double lon) {
    _lat = lat;
    _lon = lon;
  }

  @action
  Future<void> getCurrentCityName() async {
    var locality = await GetCurrentLocation().getCurrentLocationName();
    setCityName(locality);
  }

  @action
  Future<void> getCurrentPosition() async {
    var position = await GetCurrentLocation().determinePosition();
    setPosition(position.latitude, position.longitude);
  }

  @action
  Future<void> getSelectedPosition(double lat, double lon) async {
    setPosition(lat, lon);
  }
}

class GetHomeStateManager {
  static final HomeStateManager homeStateManager = HomeStateManager();
}
