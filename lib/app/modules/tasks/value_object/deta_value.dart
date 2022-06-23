import 'package:intl/intl.dart';

class DetaValue {
  static String setDate() {
    DateTime date = DateTime.now();
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }
}
