import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/widget/labels/price_label.dart';
import 'package:khazaneh/constant/margin/app_margin.dart';
import 'package:khazaneh/constant/routes/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:khazaneh/view/transactions/add_edit_transaction_screen.dart';


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
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: size.width,
      decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(8)
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
          children: [
            Expanded(
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(right: AppMargin.bodyMargin),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: transactionEntity.transactionType == TransactionType.receipt? AppColors.greenColor.withOpacity(0.2) : AppColors.redColor.withOpacity(0.2)
                  ),
                  child: transactionEntity.transactionType == TransactionType.receipt? const Icon(Icons.keyboard_arrow_up_sharp,size: 64,color: AppColors.greenColor,) : const Icon(Icons.keyboard_arrow_down_sharp,size: 64,color: AppColors.redColor,),

                ),
                const SizedBox(width: 12),
                //transaction information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width : size.width / 3,
                        child: Text(transactionEntity.title,
                            style: textTheme.headline5!.apply(fontSizeFactor: 0.8),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                        )),
                    const SizedBox(height: 6),
                    Text(transactionEntity.date,style: textTheme.caption)
                  ],
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                  transactionEntity.price.separator.withPriceLable,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: textTheme.headline2!.apply(
                    fontSizeFactor: 0.8,
                    color: transactionEntity.transactionType == TransactionType.receipt?
                    AppColors.greenColor :
                        AppColors.redColor
                  ),
              ),
            )
          ],
        )
      ),
    );
  }
}

