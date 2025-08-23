import 'package:intl/intl.dart';

class DateTimeFormatting {
  // Format: dd MMM yyyy hh:mm a (e.g., 08 Jun 2024 02:30 PM)
  static String formatActive(DateTime date) {
    try {
      return DateFormat('dd MMM yyyy hh:mm a').format(date);
    } catch (e) {
      return '';
    }
  }

  // Format: yyyy-MM-dd (e.g., 2024-06-08)
  static String formatDateYMD(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Format: dd/MM/yyyy (e.g., 08/06/2024)
  static String formatDateDMY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Format: MMM dd, yyyy (e.g., Jun 08, 2024)
  static String formatDateLong(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  // Format: HH:mm (24-hour, e.g., 14:30)
  static String formatTime24(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  // Format: hh:mm a (12-hour, e.g., 02:30 PM)
  static String formatTime12(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  // Format: yyyy-MM-dd HH:mm (e.g., 2024-06-08 14:30)
  static String formatDateTimeYMDHM(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  // Parse a string to DateTime (tries multiple formats)
  static DateTime? tryParse(String value) {
    final formats = ['yyyy-MM-dd', 'dd/MM/yyyy', 'MMM dd, yyyy', 'yyyy-MM-dd HH:mm', 'dd/MM/yyyy HH:mm', 'yyyy-MM-ddTHH:mm:ss'];
    for (final format in formats) {
      try {
        return DateFormat(format).parseStrict(value);
      } catch (_) {}
    }
    return null;
  }
}
