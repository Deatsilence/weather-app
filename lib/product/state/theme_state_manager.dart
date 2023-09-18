import 'package:f_weather/product/init/theme/utility/theme_data_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_state_manager.g.dart';

class ThemeStateManager = ThemeStateManagerBase with _$ThemeStateManager;

abstract class ThemeStateManagerBase with Store {
  @observable
  ThemeData theme = ThemeDataManager().darkTheme;

  @observable
  bool isNight = true;

  @action
  void changeThemeData() {
    isNight = !isNight;
    theme = isNight ? ThemeDataManager().darkTheme : ThemeDataManager().lightTheme;
  }
}

@immutable
final class GetThemeStateManager {
  static final ThemeStateManager themeStateManager = ThemeStateManager();
}
