import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


class TransactionController extends GetxController {
  final TextEditingController transactionTitleController = TextEditingController();
  final TextEditingController transactionPriceController = TextEditingController();
  final TextEditingController transactionTimeController = TextEditingController();
  var selectedTransactionType = TransactionType.receipt.obs;
  Rx<TransactionEntity> transactionEntity = TransactionEntity().obs;

  String year = Jalali.now().year.toString();
  String moth = Jalali.now().month.toString().length == 1? '0${ Jalali.now().month.toString()}' :  Jalali.now().month.toString();
  String toDay = Jalali.now().day.toString().length ==1? '0${Jalali.now().day.toString()}' : Jalali.now().day.toString();

  final transactionHiveBox = Hive.box<TransactionEntity>(DataBaseKey.transactionHiveKey);




  addTransaction(){
    //مقدار دهی اولیه فیلد ها
    transactionEntity.value.title = transactionTitleController.text;
    transactionEntity.value.price = int.parse(transactionPriceController.text);
    transactionEntity.value.date = transactionTimeController.text;
    transactionEntity.value.transactionType = selectedTransactionType.value;

    if(transactionTitleController.text.isEmpty || transactionPriceController.text.isEmpty){
      showSnackBar(title: 'خطا',content: 'لطفا تمام اطلاعات تراکنش را وارد کنید!');
    }
    //ادیت کردن ایتم
    else if(transactionEntity.value.isInBox){
      transactionEntity.value.save();
      transactionEntity.value = TransactionEntity();
      clearForm();
    }
    // اضافه کردن ایتم
    else{
      transactionHiveBox.add(transactionEntity.value);
      transactionEntity.value = TransactionEntity();
      clearForm();
    }

  }
  updateTransactionNavigation(TransactionEntity transactionItem){
    transactionEntity.value = transactionItem;
    Get.to(AddOrEditTransaction(isEdit: true));
    transactionTitleController.text = transactionItem.title;
    transactionPriceController.text = transactionItem.price.toString();
    selectedTransactionType.value = transactionItem.transactionType;
    transactionTimeController.text = transactionItem.date;
  }
  deleteTransaction(BuildContext context,TransactionEntity transactionEntity){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('هشدار',style: TextStyle(color: AppColors.redColor,fontSize: 26,fontWeight: FontWeight.w700),),
            content: const Text('ایا از حذف تراکنش مورد نظر مطمئن هستید؟ تراکنش های حذف شده قابل بازیابی نیستند',style: TextStyle(fontSize: 14),),
            actions: [
              TextButton(
                  onPressed: () {
                    transactionEntity.delete();
                    Get.back();
                    },
                  child: const Text('بله، حذف کن',style: TextStyle(fontSize: 16,color: AppColors.redColor))),
              TextButton(
                  onPressed: () {Get.back();},
                  child: const Text('نه پشیمون شدم',style: TextStyle(fontSize: 16,color: AppColors.lightGrayColor),))
            ],
          );
        },
    );
  }
  // انتخاب تاریخ
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
    transactionTimeController.text = '$years/$moth/$day';
  }
  clearForm(){
    transactionTitleController.clear();
    transactionPriceController.clear();
    transactionTimeController.clear();
    selectedTransactionType.value = TransactionType.receipt;
    Get.back();

  }

  // محاسبه دریافتی ها و پرداختی ها
  String getDate(){
    return '$year/$moth/$toDay';
  }
  int paymentTodayCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date == getDate() && value.transactionType == TransactionType.payment){
        result += value.price;
      }
    }
    return result;
  }
  int receiptTodayCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date == getDate() && value.transactionType == TransactionType.receipt){
        result += value.price;
      }
    }
    return result;
  }

  int paymentMothCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(5,7) == moth && value.transactionType == TransactionType.payment){
        result += value.price;
      }
    }
    return result;
  }
  int receiptMothCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(5,7) == moth && value.transactionType == TransactionType.receipt){
        result += value.price;
      }
    }
    return result;
  }

  int paymentYearCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(0,4) == year && value.transactionType == TransactionType.payment){
        result += value.price;
      }
    }
    return result;

  }
  int receiptYearCalculator(){
    int result = 0;
    for(var value in transactionHiveBox.values){
      if(value.date.substring(0,4) == year && value.transactionType == TransactionType.receipt){
        result += value.price;
      }
    }
    return result;

  }


}

