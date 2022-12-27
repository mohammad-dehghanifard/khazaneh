import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/widget/price_label.dart';
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';


class TransactionListItem extends StatelessWidget {
   TransactionListItem({
    Key? key,
    required this.transactionEntity,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;
  final TransactionEntity transactionEntity;
  final TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: InkWell(
        onTap: () {
          transactionController.updateTransactionNavigation(transactionEntity);
        },
        onLongPress: () {
          transactionController.deleteTransaction(context,transactionEntity);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                margin: EdgeInsets.only(right: AppMargin.bodyMargin),
                width: 89,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transactionEntity.transactionType == TransactionType.receipt? AppColors.greenColor.withOpacity(0.5) : AppColors.redColor.withOpacity(0.5)
                ),
                child: transactionEntity.transactionType == TransactionType.receipt? const Icon(Icons.keyboard_arrow_up_sharp,size: 64,) : const Icon(Icons.keyboard_arrow_down_sharp,size: 64,),

              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactionEntity.title,style: textTheme.headline5),
                  const SizedBox(height: 6),
                  Text(transactionEntity.date,style: textTheme.caption)
                ],
              ),
            ],),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Expanded(
                child: Text(
                    transactionEntity.price.withPriceLable,
                    style: textTheme.headline5!.apply(
                      color: transactionEntity.transactionType == TransactionType.receipt?
                      AppColors.greenColor :
                          AppColors.redColor
                    ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

/*
Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text(transactionEntity.title),
                  const SizedBox(height: 12),
                  Text("تومان  ${transactionEntity.price}",style: textTheme.headline1,),
                  const SizedBox(height: 12),
                  Text("تاریخ : ${transactionEntity.date}",style: textTheme.bodyText1!.apply(color: Colors.white,fontSizeFactor: 0.9),),

                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 16),
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  color: AppColors.lightGrayColor,
                  shape: BoxShape.circle
              ),
              child: transactionEntity.transactionType == TransactionType.receipt?
              const Icon(Icons.keyboard_arrow_up_sharp,color: AppColors.greenColor,size: 80,) :
              const Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.redColor,size: 80,),
            )
          ],
        ),
 */