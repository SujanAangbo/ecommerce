import 'package:intl/intl.dart';

class Formatters {
  static String formatNumber(int number) {
    NumberFormat numberFormat = NumberFormat("रु #,##,##,###");
    return numberFormat.format(number);
  }

  static String formatDate(DateTime dateTime) {
    DateTime localDate = dateTime.toLocal();
    DateFormat dateFormat = DateFormat("dd MMM y, hh:mm a");
    return dateFormat.format(localDate);
  }
}
