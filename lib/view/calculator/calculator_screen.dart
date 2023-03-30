import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/controller/calculator/calculator_controller.dart';
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
                      children: [
                        //user input
                        Text(controller.userInput.value,style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 26)),
                        const SizedBox(height: 10),
                        //user output
                        Text(controller.userOutput.value,style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 32,color: AppColors.redColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.09),
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
                                     textColor: AppColors.greenColor,
                                     onTap: () => controller.clearInputAndOutPut());
                               case 1 :
                                 // DEL btn
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     textColor: AppColors.greenColor,
                                     onTap: () => controller.deleteLastNumber());
                               case 19 :
                                 // = btn
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
                                     textColor: AppColors.redColor,
                                     onTap: () => controller.calculate());
                               default:
                                 return CalculatorBtn(
                                     bgColor: AppColors.scaffoldColor,
                                     text: controller.operators[index],
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
