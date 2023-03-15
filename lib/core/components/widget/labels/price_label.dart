import 'package:intl/intl.dart';

extension SperatorNumber on int{
  String get separator{
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }

}

extension PriceLable on String{
  String get withPriceLable => "$this تومان ";
}

