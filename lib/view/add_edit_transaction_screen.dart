import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import '../gen/assets.gen.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


class AddOrEditTransaction extends StatelessWidget {
  AddOrEditTransaction({Key? key}) : super(key: key);
  final TransactionController transactionController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
      return Scaffold(
        appBar: secondaryAppBar(),
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.all(24),
            child: Obx(
              ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icons.logotest.image(width: 230),
                  TextField(
                    controller: transactionController.transactionTitleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "عنوان را وارد کنید",
                        hintStyle: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),
                        fillColor: AppColors.darkGrayColor
                    ),
                  ),
                  const SizedBox(height: 28),
                  TextField(
                    controller: transactionController.transactionPriceController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "مبلغ را وارد کنید",
                        hintStyle: Theme.of(context).textTheme.subtitle1!.apply(color: Colors.white),
                        fillColor: AppColors.darkGrayColor
                    ),
                  ),
                  const SizedBox(height: 28),
                  //قسمت تاریخ
                  Container(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkGrayColor,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('تاریخ تراکنش : '),
                        TextButton(
                            onPressed: () => transactionController.timePicker(context),
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(AppColors.lightGrayColor)
                            ),
                            child: Text(transactionController.transactionTime.value,
                              style: textTheme.subtitle1!.apply(color: Colors.white),))
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  CupertinoSlidingSegmentedControl<TransactionType>(
                    children: const {
                      TransactionType.receipt : Text("دریافتی"),
                      TransactionType.payment : Text("پرداختی"),
                    },
                    groupValue: transactionController.selectedTransactionType.value,
                    backgroundColor: AppColors.darkGrayColor,
                    thumbColor: AppColors.appBtnColor,
                    onValueChanged: (value) {
                      transactionController.selectedTransactionType.value = value!;
                    },),
                  const SizedBox(height: 28),

                  SizedBox(height: Get.height / 12),
                  ElevatedButton(
                      onPressed: () => transactionController.addTransaction(),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))
                      ),
                      child: const Text(AppStrings.addTransactionTxt)),

                ],
              ),
            ),
          ),

        ),
      );

  }


}

