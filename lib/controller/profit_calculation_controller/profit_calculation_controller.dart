import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfitCalculationController extends GetxController {
  TextEditingController calculationTextController = TextEditingController();
  TextEditingController profitTextController = TextEditingController();

//نتیجه محاسبه سود روزانه
  RxInt profitOneDayCalculationResult = 0.obs;

// نتیجه محسابقه سود 30 روز
  RxInt profit30DayCalculationResult = 0.obs;

// نتیجه محسابقه سود 31 روز
  RxInt profit31DayCalculationResult = 0.obs;

// نتیجه محاسبه سود سالانه
  RxInt profitYearCalculationResult = 0.obs;

  //محسابقه سود روزانه
  calculationOneDayProfit(){}
  // محسابه سود 30 روز
  calculation30DayProfit(){}
  // محسابه سود 31 روز
  calculation31DayProfit(){}
  // محسابه سود سالانه
  calculationYearProfit(){}
}
