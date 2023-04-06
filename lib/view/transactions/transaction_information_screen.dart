// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/animations/opcity_animation.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/core/components/widget/charts/chart_widget.dart';
import 'package:khazaneh/core/components/widget/labels/price_label.dart';
import 'package:khazaneh/core/constant/margin/app_margin.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class TransactionInformation  extends StatelessWidget {
   TransactionInformation({Key? key}) : super(key: key);
  TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: secondaryAppBar(pageTitle: 'آمار تراکنش ها'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.bodyMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // chart
              Container(
                width: size.width,
                height: 230,
                margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
                decoration: const BoxDecoration(
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: const OpacityAnimation(
                    duration:  Duration(milliseconds: 1300),
                    startValue: 0,
                    endValue: 1,
                    child:  AppChart()),
              ),
              // دریافتی ها
              SlideInAnimation(
                animDirection:  AxisDirection.left,
                slideAnimDuration: const Duration(milliseconds: 1000),
                opacityAnimDuration: const Duration(milliseconds: 1000),
                child: Container(
                  width: size.width,
                  height: 191,
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Center(child: Text('دریافتی ها',style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.greenColor))),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(height: 1,color: AppColors.grayColor),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.todayReceiptTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                text: ' ${transactionController.receiptTodayCalculator().separator}'.withPriceLable,
                                style: AppTextStyle.headlineTxtStyle2.copyWith(color: AppColors.greenColor,fontSize: 14)
                              )
                            ]
                          ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.monthReceiptTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                text: ' ${transactionController.receiptMothCalculator().separator}'.withPriceLable,
                                style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                              )
                            ]
                          ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                            text: AppStrings.yearReceiptTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' ${transactionController.receiptYearCalculator().separator}'.withPriceLable,
                                  style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              //پرداختی ها
              SlideInAnimation(
                animDirection: AxisDirection.right,
                slideAnimDuration: const Duration(milliseconds: 1000),
                opacityAnimDuration: const Duration(milliseconds: 1000),
                child: Container(
                  width: size.width,
                  height: 191,
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Center(child: Text('پرداختی ها',style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.redColor))),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(height: 1,color: AppColors.grayColor),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                            text: AppStrings.todayPaymentTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' ${transactionController.paymentTodayCalculator().separator}'.withPriceLable,
                                  style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.redColor,fontSize: 14)
                              )
                            ]
                        ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                            text: AppStrings.monthPaymentTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' ${transactionController.paymentMothCalculator().separator}'.withPriceLable,
                                  style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.redColor,fontSize: 14)
                              )
                            ]
                        ),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                            text: AppStrings.yearPaymentTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' ${transactionController.paymentYearCalculator().separator}'.withPriceLable,
                                  style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.redColor,fontSize: 14)
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height / 12)
            ],
          ),
        ),
      ),
    );
  }
}
