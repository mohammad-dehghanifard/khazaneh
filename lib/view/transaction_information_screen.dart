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
import 'package:khazaneh/components/widget/price_label.dart';
import 'package:khazaneh/constant/app_margin.dart';
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
      appBar: secondaryAppBar(pageTitle: 'آمار تراکنش ها'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.bodyMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 230,
              margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
              decoration: const BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: const AppChart(),
            ),
            Text('آمار کامل تراکنش ها',style: theme.headline5!.apply(color: AppColors.primaryColor)),
            const SizedBox(height: 16),
            // دریافتی ها
            Container(
              width: Get.width,
              height: 191,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 4)
                  )
                ]
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text('دریافتی ها',style: theme.headline5!.apply(color: AppColors.primaryColor)),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(height: 4,color: AppColors.grayColor),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                      text: TextSpan(
                          text: AppStrings.todayReceiptTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                            text: ' ${transactionController.receiptTodayCalculator()}'.withPriceLable,
                            style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                      ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                      text: TextSpan(
                          text: AppStrings.monthReceiptTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                            text: ' ${transactionController.receiptMothCalculator()}'.withPriceLable,
                            style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                      ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                        text: AppStrings.yearReceiptTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                              text: ' ${transactionController.receiptYearCalculator()}'.withPriceLable,
                              style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: Get.width,
              height: 191,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),blurRadius: 10,offset: const Offset(0, 4)
                    )
                  ]
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text('پرداختی ها',style: theme.headline5!.apply(color: AppColors.primaryColor)),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(height: 4,color: AppColors.grayColor),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                        text: AppStrings.todayPaymentTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                              text: ' ${transactionController.paymentTodayCalculator()}'.withPriceLable,
                              style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                        text: AppStrings.monthPaymentTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                              text: ' ${transactionController.paymentMothCalculator()}'.withPriceLable,
                              style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                        text: AppStrings.yearPaymentTxt,style: theme.headline5,
                        children: [
                          TextSpan(
                              text: ' ${transactionController.paymentYearCalculator()}'.withPriceLable,
                              style: theme.headline5!.apply(color: AppColors.grayColor)
                          )
                        ]
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
