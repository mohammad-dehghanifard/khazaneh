import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


class TransactionController extends GetxController {
  final TransactionEntity transactionEntity = TransactionEntity();
  final TextEditingController transactionTitleController = TextEditingController();
  final TextEditingController transactionPriceController = TextEditingController();
  var selectedTransactionType = TransactionType.payment.obs;
  RxString transactionTime = 'انتخاب تاریخ'.obs;

  String year = Jalali.now().year.toString();
  String moth = Jalali.now().month.toString().length == 1? '0${ Jalali.now().month.toString()}' :  Jalali.now().month.toString();
  String toDay = Jalali.now().day.toString().length ==1? '0${Jalali.now().day.toString()}' : Jalali.now().day.toString();


  final transactionHiveBox = Hive.box<TransactionEntity>(DataBaseKey.transactionHiveKey);
  final transactionItemList = Hive.box<TransactionEntity>(DataBaseKey.transactionHiveKey).values.toList();


  String getDate(){
    return '$year/$moth/$toDay';
  }

  double paymentTodayCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date == getDate() && value.transactionType == TransactionType.payment){
        result += double.parse(value.price);
      }
    }
    return result;
  }
  double receiptTodayCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date == getDate() && value.transactionType == TransactionType.receipt){
        result += double.parse(value.price);
      }
    }
    return result;
  }

  double paymentMothCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(5,7) == moth && value.transactionType == TransactionType.payment){
        result += double.parse(value.price);
      }
    }
    return result;
  }
  double receiptMothCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(5,7) == moth && value.transactionType == TransactionType.receipt){
        result += double.parse(value.price);
      }
    }
    return result;
  }

  double paymentYearCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(0,4) == year && value.transactionType == TransactionType.payment){
        result += double.parse(value.price);
      }
    }
    return result;

  }
  double receiptYearCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(0,4) == year && value.transactionType == TransactionType.receipt){
        result += double.parse(value.price);
      }
    }
    return result;

  }

  addTransaction(){
    if(transactionTitleController.text.isEmpty || transactionPriceController.text.isEmpty){
      showSnackBar(title: 'خطا',content: 'لطفا تمام اطلاعات تراکنش را وارد کنید!');
    }else{
       transactionEntity.title = transactionTitleController.text;
       transactionEntity.price = transactionPriceController.text;
       transactionEntity.date = transactionTime.value;
       transactionEntity.transactionType = selectedTransactionType.value;
       transactionHiveBox.add(transactionEntity);
       Get.back();

    }

  }
  deleteTransaction(TransactionEntity transactionEntity){
    transactionEntity.delete();
  }
  timePicker(BuildContext context) async {
    var selectedTime = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400),
      lastDate: Jalali(1422),
    );
    String years = selectedTime!.year.toString().length == 1 ? '0${selectedTime.year.toString()}' : selectedTime.year.toString();
    String moth = selectedTime.month.toString().length == 1 ? '0${selectedTime.month.toString()}' : selectedTime.month.toString();
    String day = selectedTime.day.toString().length == 1 ? '0${selectedTime.day.toString()}' : selectedTime.day.toString();
    transactionTime.value = '$years/$moth/$day';
  }


}

