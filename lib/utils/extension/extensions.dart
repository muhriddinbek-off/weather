import 'package:intl/intl.dart';

extension ParseStringToDate on String {
  String getDayName() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat("EEEE").format(dateTime);
  }

  String getMonthAndDate() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat("MMMM, d").format(dateTime);
  }

  String getTime() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat("HH:mm").format(dateTime);
  }
}
