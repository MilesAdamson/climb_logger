import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  static const monthStrings = {
    "jan": 1,
    "feb": 2,
    "mar": 3,
    "apr": 4,
    "may": 5,
    "jun": 6,
    "jul": 7,
    "aug": 8,
    "sept": 9,
    "oct": 10,
    "nov": 11,
    "dec": 12,
  };

  String get formattedDate {
    bool isSameYear = year == DateTime.now().year;

    return isSameYear
        ? DateFormat.MMMd().format(this)
        : DateFormat.yMMMd().format(this);
  }

  String get formattedDateAndYear => DateFormat.yMMMd().format(this);

  String get formattedDateAndTime {
    bool isSameYear = year == DateTime.now().year;

    return isSameYear
        ? DateFormat.MMMd().add_jm().format(this)
        : DateFormat.yMMMd().add_jm().format(this);
  }

  String get formattedTime => DateFormat.jm().format(this);

  DateTime truncate() => DateTime(year, month, day);

  DateTime roundUpToEndOfDay() => DateTime(year, month, day, 23, 59, 59, 999);

  static DateTime? tryParse(input) {
    var trimmed = "$input".trim();

    trimmed = trimmed.replaceAll(r"\", "-");
    trimmed = trimmed.replaceAll(r"/", "-");

    final month = monthStrings.keys.firstWhereOrNull(
        (month) => trimmed.toLowerCase().contains(month.toLowerCase()));

    if (month != null) {
      int monthNumber = monthStrings[month]!;
      final parts = trimmed.split(" ").map((e) => e.replaceAll(",", ""));
      final dateNumber = int.tryParse(parts.elementAt(1));
      final yearNumber = int.tryParse(parts.elementAt(2));

      if (yearNumber != null && dateNumber != null) {
        return DateTime(yearNumber, monthNumber, dateNumber);
      }
    }

    return DateTime.tryParse(trimmed);
  }
}
