import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/constant/strings/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import '../../gen/assets.gen.dart';


class AddOrEditTransaction extends StatefulWidget {
  final bool isEdit;
  const AddOrEditTransaction({Key? key,this.isEdit = false}) : super(key: key);

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
    final textTheme = Theme.of(context).textTheme;
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
                  Image.asset(Assets.icons.khazanehlogo.path),
                  const SizedBox(height: 28),
                  //قسمت دریافت عنوان و مبلغ
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: transactionController.transactionTitleController,
                      decoration: InputDecoration(
                          hintText: "عنوان را وارد کنید",
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: transactionController.transactionPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "مبلغ را وارد کنید",
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                          fillColor: AppColors.darkGrayColor
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  //قسمت تاریخ
                  Row(
                    children: [
                      Expanded(child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: transactionController.transactionTimeController,
                          decoration: const InputDecoration(
                            hintText: 'تاریخ را وارد کنید'
                          ),
                        ),
                      )),
                      Container(
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
                      )
                    ],
                  ),
                  const SizedBox(height: 28),
                  // انتخاب نوع تراکنش
                  CupertinoSlidingSegmentedControl<TransactionType>(
                    children:  {
                      TransactionType.receipt : Text("دریافتی",style: textTheme.bodyText2!.apply(color: transactionController.selectedTransactionType.value == TransactionType.receipt? Colors.white : AppColors.textColor ),),
                      TransactionType.payment : Text("پرداختی",style: textTheme.bodyText2!.apply(color: transactionController.selectedTransactionType.value == TransactionType.payment? Colors.white : AppColors.textColor )),
                    },
                    groupValue: transactionController.selectedTransactionType.value,
                    backgroundColor: Colors.white,
                    thumbColor: transactionController.selectedTransactionType == TransactionType.receipt? AppColors.greenColor : AppColors.redColor,
                    onValueChanged: (value) {
                      transactionController.selectedTransactionType.value = value!;
                    },),
                  const SizedBox(height: 28),

                  SizedBox(height: Get.height / 12),
                  ElevatedButton(
                      onPressed: () {
                        transactionController.addTransaction();
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                      ),
                      child:  Text(widget.isEdit?AppStrings.editTransactionTxt:AppStrings.addTransactionTxt,style: textTheme.headline2,)),

                ],
              ),
            ),
          ),

        ),
      );

  }
}

