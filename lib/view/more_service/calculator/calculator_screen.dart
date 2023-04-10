import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/controller/calculator/calculator_controller.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/core/components/widget/calculator/calculator_btn.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculateController controller = Get.put(CalculateController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: secondaryAppBar(pageTitle: 'ماشین حساب'),
      backgroundColor: AppColors.scaffoldColor,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SafeArea(
          child: Obx(
            () {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // user input and output
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 12),
                    width: double.infinity,
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //user input
                        Text(controller.userInput.value,style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 26)),
                        const SizedBox(height: 10),
                        // user output
                        RichText(
                            text: controller.userOutput.value != ''? TextSpan(
                              text: " = ",
                              style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 24,color: AppColors.redColor),
                              children: [
                                // show user output txt
                                TextSpan(
                                    text: controller.userOutput.value,
                                    style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 32,color: AppColors.redColor)),
                              ]
                            ) : const TextSpan()
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.09),
                  // btn list
                  Expanded(
                      child: Container(
                       decoration: const BoxDecoration(
                           color: AppColors.grayColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24))
                       ),
                       child: GridView.builder(
                            itemCount: controller.operators.length,
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 4
                           ),
                           itemBuilder: (context, index) {
                             switch(index){
                               case 0 :
                                 // clear btn
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     fontSize: 18,
                                     textColor: AppColors.greenColor,
                                     onTap: () => controller.clearInputAndOutPut());
                               case 1 :
                                 // DEL btn
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     fontSize: 18,
                                     textColor: AppColors.greenColor,
                                     onTap: () => controller.deleteLastNumber());
                               case 19 :
                                 // = btn
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     fontSize: 16,
                                     textColor: AppColors.redColor,
                                     onTap: () => controller.calculate());
                               default:
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     fontSize: 16,
                                     textColor: controller.isOperator(controller.operators[index]) ? Colors.red : Colors.black,
                                     onTap: () => controller.onBtnPressed(index));
                             }
                           },
                       ),
                      ))
                ],
              );
            },
          ),
        ),
      )
    );
  }
}

