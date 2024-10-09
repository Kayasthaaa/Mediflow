import 'package:intl/intl.dart';

abstract class CustomDateFormatter {
  static String shortScheduleDateFormatter(DateTime dateTime) {
    return DateFormat('E, d MMMM').format(dateTime);
  }

  static String longScheduleDateFormatter(DateTime dateTime) {
    return DateFormat('EEEE, d MMMM y').format(dateTime);
  }
}
