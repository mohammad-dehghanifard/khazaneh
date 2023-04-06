import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/animations/opcity_animation.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import '../../gen/assets.gen.dart';


class AddOrEditTransaction extends StatefulWidget {

  const AddOrEditTransaction({Key? key}) : super(key: key);

  @override
  State<AddOrEditTransaction> createState() => _AddOrEditTransactionState();
}

class _AddOrEditTransactionState extends State<AddOrEditTransaction> {
  final TransactionController transactionController = Get.put(TransactionController());

  @override
  void initState() {
    transactionController.transactionEntity.value = Get.arguments;
    transactionController.setUpdateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: secondaryAppBar(pageTitle: transactionController.transactionEntity.value.title != '' ?
        'ویرایش تراکنش'
         :'اضافه کردن تراکنش جدید'),
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.all(24),
            child: Obx(
              ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo
                  OpacityAnimation(
                      duration: const Duration(milliseconds: 800),
                      startValue: 0,
                      endValue: 1,
                      child: Image.asset(Assets.icons.khazanehlogo.path)),
                  const SizedBox(height: 28),
                  //input title text field
                  SlideInAnimation(
                    animDirection: AxisDirection.left,
                    slideAnimDuration: const Duration(milliseconds: 900),
                    opacityAnimDuration: const Duration(milliseconds: 1000),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: transactionController.transactionTitleController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(3),
                            hintText: "عنوان را وارد کنید",
                            hintStyle: AppTextStyle.subTitleTxtStyle1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // input price text field
                  SlideInAnimation(
                    animDirection: AxisDirection.right,
                    slideAnimDuration: const Duration(milliseconds: 950),
                    opacityAnimDuration: const Duration(milliseconds: 1000),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: transactionController.transactionPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(3),
                            hintText: "مبلغ را وارد کنید",
                            hintStyle: AppTextStyle.subTitleTxtStyle1,
                            fillColor: AppColors.darkGrayColor
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  //input date text field
                  Row(
                    children: [
                      Expanded(child: SlideInAnimation(
                        animDirection: AxisDirection.left,
                        slideAnimDuration: const Duration(milliseconds: 1000),
                        opacityAnimDuration: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: transactionController.transactionTimeController,
                            decoration: const InputDecoration(
                              contentPadding:  EdgeInsets.all(3),
                              hintText: 'تاریخ را وارد کنید'
                            ),
                          ),
                        ),
                      )),
                      OpacityAnimation(
                        duration: const Duration(milliseconds: 1300),
                        startValue: 0,
                        endValue: 1,
                        child: Container(
                          width: 61,
                          height: 54,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: IconButton(
                            onPressed: () => transactionController.timePicker(context),
                            icon: const Icon(CupertinoIcons.calendar_badge_plus,size: 40,color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 28),
                  // انتخاب نوع تراکنش
                  OpacityAnimation(
                    duration: const Duration(milliseconds: 1300),
                    startValue: 0,
                    endValue: 1,
                    child: CupertinoSlidingSegmentedControl<TransactionType>(
                      children:  {
                        TransactionType.receipt : Text("دریافتی",style: AppTextStyle.defaultTxtStyle.apply(color: transactionController.selectedTransactionType.value == TransactionType.receipt? Colors.white : AppColors.textColor ),),
                        TransactionType.payment : Text("پرداختی",style: AppTextStyle.defaultTxtStyle.apply(color: transactionController.selectedTransactionType.value == TransactionType.payment? Colors.white : AppColors.textColor )),
                      },
                      groupValue: transactionController.selectedTransactionType.value,
                      backgroundColor: Colors.white,
                      thumbColor: transactionController.selectedTransactionType == TransactionType.receipt? AppColors.greenColor : AppColors.redColor,
                      onValueChanged: (value) {
                        transactionController.selectedTransactionType.value = value!;
                      },),
                  ),
                  const SizedBox(height: 28),

                  SizedBox(height: Get.height / 12),
                  OpacityAnimation(
                    duration: const Duration(milliseconds: 1000),
                    startValue: 0,
                    endValue: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          transactionController.addTransaction();
                        },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                        ),
                        child:  Text(transactionController.transactionEntity.value.title != '' ? AppStrings.editTransactionTxt:AppStrings.addTransactionTxt,style: AppTextStyle.headlineTxtStyle2)),
                  ),

                ],
              ),
            ),
          ),

        ),
      );

  }
}

