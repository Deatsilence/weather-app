import 'package:f_weather/product/models/predictions_model.dart';
import 'package:f_weather/product/viewModels/places_view_model.dart';
import 'package:f_weather/product/viewModels/weather_forecast_view_model.dart';

mixin SearchPlacesMixin {
  final placesViewModel = PlacesViewModel();
  final weatherViewModel = WeatherViewModel();

  List<Predictions> getPlaces() {
    var predictions = placesViewModel.places.predictions;
    if (predictions != null && predictions.isNotEmpty) {
      return predictions;
    }
    return [];
  }
}
