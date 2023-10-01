import 'package:mobx/mobx.dart';
part 'home_state_manager.g.dart';

class HomeStateManager = HomeStateManagerBase with _$HomeStateManager;

abstract class HomeStateManagerBase with Store {
  @observable
  String cityName = "Kars";

  @action
  void setCityName(String name) {
    cityName = name;
  }
}

class GetHomeStateManager {
  static final HomeStateManager homeStateManager = HomeStateManager();
}
