import 'package:intl/intl.dart';

extension PriceLable on String{
  String get withPriceLable => "${this} تومان ";

  String get separator{
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}



/*
  String get separateByComma{
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
 */