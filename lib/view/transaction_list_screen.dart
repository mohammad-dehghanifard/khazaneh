import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

import '../components/items/transaction_listItem.dart';

class TransactionListScreen extends StatelessWidget {
   TransactionListScreen({Key? key}) : super(key: key);
  final TransactionController transactionController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      appBar: secondaryAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //helper texts
            Padding(
              padding: const EdgeInsets.fromLTRB(16,24,16,0),
              child: Row(
                children:  [
                 const Icon(Icons.keyboard_arrow_up_sharp,color: AppColors.greenColor,size: 60,),
                  Text(AppStrings.paymentHelpTxt,style: textTheme.bodyText1!.apply(color: Colors.white))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children:  [
                 const Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.redColor,size: 60,),
                  Text(AppStrings.receiptHelpTxt,style: textTheme.bodyText1!.apply(color: Colors.white))
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32,0,32,16),
              child: Text(AppStrings.listDescription,style: textTheme.subtitle1!.apply(color: Colors.white),),
            ),

            //Transaction List
            SizedBox(
              height: Get.height / 2,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: transactionController.transactionItemList.length,
                itemBuilder: (context, index) {
                  final item = transactionController.transactionItemList[index];
                return TransactionListItem(textTheme: textTheme,transactionEntity: item);
              },),
            ),

            //btn
            Padding(
              padding: const EdgeInsets.fromLTRB(8,12,8,0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))
                ),
                  onPressed: () {
                    Get.toNamed(RouteAPP.routeAddOrEditTransactionScreen);
                  },
                  child: const Text(AppStrings.addTransactionTxt)
              ),
            )
          ],
        ),
      ),
    );
  }
}


