import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/components/bottom_navigation.dart';
import 'package:khazaneh/components/widget/chart_widget.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';

class TransactionInformation  extends StatelessWidget {
   TransactionInformation({Key? key}) : super(key: key);
  TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: secondaryAppBar(),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
            decoration: const BoxDecoration(
              color: AppColors.darkGrayColor,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: const AppChart(),
          ),

          Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                margin: const EdgeInsets.fromLTRB(16,0,16,42),
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.darkGrayColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    // دریافتی ها
                    const Text("دریافتی ها :"),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.todayReceiptTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.receiptTodayCalculator()}",style: theme.headline2,),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.monthReceiptTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.receiptMothCalculator()}",style: theme.headline2,),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.yearReceiptTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.receiptYearCalculator()}",style: theme.headline2,),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.all(6),
                      child: Divider(color: AppColors.lightGrayColor,height: 10,),
                    ),

                    //پرداختی ها
                     const Text("پرداختی ها : "),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.todayPaymentTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.paymentTodayCalculator()}",style: theme.headline2,),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.monthPaymentTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.paymentMothCalculator()}",style: theme.headline2,),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(AppStrings.yearPaymentTxt,style: theme.headline2,),
                        const SizedBox(width: 8),
                        Text("${transactionController.paymentYearCalculator()}",style: theme.headline2,),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
