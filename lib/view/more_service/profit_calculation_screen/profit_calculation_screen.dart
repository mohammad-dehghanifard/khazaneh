import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/controller/profit_calculation_controller/profit_calculation_controller.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/core/components/widget/labels/price_label.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class ProfitCalculationScreen extends StatelessWidget {
  const ProfitCalculationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProfitCalculationController profitController = Get.put(ProfitCalculationController());
    return Obx(
      (){
        return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: secondaryAppBar(pageTitle: 'محسابه سود بانکی'),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(Assets.icons.profiticon.path,height: size.height / 5,),
                SizedBox(height: size.height * 0.06,),
                // دریافت مبلغ کل سرمایه از کاربر
                SizedBox(
                  height: size.height * 0.07,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: profitController.calculationTextController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'مبلغ سرمایه گذاری را وار کنید'
                    ),
                  ),
                ),
                // دریاقت درصد سود سالانه از کاربر
                SizedBox(
                  height: size.height * 0.07,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: profitController.profitTextController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'درصد سود سالانه را وارد کنید(به عنوان مثال 18)'
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                // نمایش نتیجه محاسبه
                SlideInAnimation(
                  animDirection: AxisDirection.right,
                  slideAnimDuration: const Duration(milliseconds: 1000),
                  opacityAnimDuration: const Duration(milliseconds: 1000),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.26,
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
                        Center(child: Text('نتیجه',style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.greenColor))),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Divider(height: 1,color: AppColors.grayColor),
                        ),
                        const SizedBox(height: 8),
                        // سود روزانه
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.profitDayTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' ${profitController.profitOneDayCalculationResult.value.separator}'.withPriceLable,
                                    style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 12),
                        // سود 30 روز
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.profit30DayTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' ${profitController.profit30DayCalculationResult.value.separator}'.withPriceLable,
                                    style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 12),
                        // سود 31 روز
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.profit31DayTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' ${profitController.profit31DayCalculationResult.value.separator}'.withPriceLable,
                                    style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 12),
                        // سود سالانه
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: AppStrings.profitYearTxt,style: AppTextStyle.headlineTxtStyle3.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: ' ${profitController.profitYearCalculationResult.value.separator}'.withPriceLable,
                                    style: AppTextStyle.headlineTxtStyle3.copyWith(color: AppColors.greenColor,fontSize: 14)
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                ElevatedButton(
                    onPressed: () => profitController.calculationProfit(),
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(size.width,size.height * 0.06))
                    ),
                    child: Text('محاسبه کن',style: AppTextStyle.defaultTxtStyle.apply(color: Colors.white),))
              ],
            ),
          ),
        ),
      );}

    );
  }
}
