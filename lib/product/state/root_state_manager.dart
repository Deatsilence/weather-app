import 'package:mobx/mobx.dart';
part 'root_state_manager.g.dart';

class RootStateManager = RootStateManagerBase with _$RootStateManager;

abstract class RootStateManagerBase with Store {
  @observable
  int selectedIndexOfBottomNavigationBar = 0;

  @action
  void setIndex(int value) {
    selectedIndexOfBottomNavigationBar = value;
  }
}

class GetRooteStateManager {
  static final RootStateManager rootStateManager = RootStateManager();
}
