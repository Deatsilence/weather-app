import 'package:f_weather/product/models/places_model.dart';
import 'package:f_weather/product/services/places_network_manager.dart';
import 'package:mobx/mobx.dart';
part 'places_view_model.g.dart';

class PlacesViewModel = _PlacesViewModelBase with _$PlacesViewModel;

abstract class _PlacesViewModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Places _places = Places();

  @computed
  Places get places => _places;

  @action
  Future<void> getSelectedPlace(String place) async {
    changeLoading();
    final response = await PredictionsNetworkManager.instance.dioGet<Places>(place, Places());
    if (response is Places) {
      _places = response;
    }
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
