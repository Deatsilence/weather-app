import 'package:mobx/mobx.dart';
part 'search_places_manager.g.dart';

class SearchPlacesManager = SearchPlacesManagerBase with _$SearchPlacesManager;

abstract class SearchPlacesManagerBase with Store {
  @observable
  bool isActiveClearButton = false;

  @action
  void changeClearButtonState({bool isActive = false}) {
    isActiveClearButton = isActive;
  }
}

class GetSearchPlacesStateManager {
  static final SearchPlacesManager searchPlacesManager = SearchPlacesManager();
}
