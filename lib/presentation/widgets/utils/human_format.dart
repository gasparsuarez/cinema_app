import 'package:intl/intl.dart';

class HumanFormat {
  static String compactNumber(double d) {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(d);
    return formattedNumber;
  }
}
