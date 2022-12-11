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


  final transactionHiveBox = Hive.box<TransactionEntity>(DataBaseKey.transactionHiveKey);
  final transactionItemList = Hive.box<TransactionEntity>(DataBaseKey.transactionHiveKey).values.toList();


  String getToDayDate(){
    String year = Jalali.now().year.toString();
    String moth = Jalali.now().month.toString().length == 1? '0${ Jalali.now().month.toString()}' :  Jalali.now().month.toString();
    String toDay = Jalali.now().day.toString().length ==1? '0${Jalali.now().day.toString()}' : Jalali.now().day.toString();
    return '$toDay/$moth/$year';
  }
  double paymentTodayCalculator(){
    double result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date == getToDayDate() && value.transactionType == TransactionType.payment){
        result += double.parse(value.price);
      }
    }
    return result;
  }
  addOrEditTransaction(){
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
    transactionTime.value = '$day/$moth/$years';
  }


}

