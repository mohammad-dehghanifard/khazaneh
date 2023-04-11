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

  //محسابه سود
  calculationProfit(){
    int totalAmount = int.parse(calculationTextController.text);
    int profit = int.parse(profitTextController.text);

    // محسابه سود سالانه
    int result = totalAmount * profit ~/ 100;
    profitYearCalculationResult.value = result;
    // محسابه سود ماهانه
    profit30DayCalculationResult.value = result ~/ 12;
    // محسابه سود روزانه
    profitOneDayCalculationResult.value = profit30DayCalculationResult.value ~/ 30;
    // محسابه سود 31 روز
    profit31DayCalculationResult.value = (profit30DayCalculationResult.value + profitOneDayCalculationResult.value).toInt();
  }


}