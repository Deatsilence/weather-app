import 'package:f_weather/product/init/mixin/location_mixin.dart';
import 'package:mobx/mobx.dart';
part 'home_state_manager.g.dart';

class HomeStateManager = HomeStateManagerBase with _$HomeStateManager;

abstract class HomeStateManagerBase with Store {
  @observable
  String _cityName = "";

  @action
  void setCityName(String name) {
    _cityName = name;
  }

  @computed
  String get getCityName => _cityName;

  @action
  Future<void> getCurrentCityName() async {
    var locality = await GetCurrentLocation().getCurrentLocationName();
    setCityName(locality);
  }
}

class GetHomeStateManager {
  static final HomeStateManager homeStateManager = HomeStateManager();
}
