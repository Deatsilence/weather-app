import 'package:f_weather/product/utility/days_utility.dart';
import 'package:intl/intl.dart';

extension DaysExtension on DaysUtility {
  List<String> get daysList {
    var date = DateTime.now();
    var dateFormat = DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
    var currentDay = this.days.firstWhere(
          (day) => day == dateFormat,
          orElse: () => this.days.first, // Provide a default value if no match is found
        );

    var index = this.days.indexOf(currentDay);
    this.days.add(this.days[index - 1]);
    var days = this.days.skip(index + 1).toList();
    days.insert(0, currentDay);
    return days;
  }
}
