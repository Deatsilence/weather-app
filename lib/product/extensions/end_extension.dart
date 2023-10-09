import 'package:f_weather/product/constants/enums/end_enum.dart';

extension EndExtension on End {
  String get rawValue {
    switch (this) {
      case End.weather:
        return "/weather";
      case End.forecast:
        return "/forecast";
    }
  }
}
