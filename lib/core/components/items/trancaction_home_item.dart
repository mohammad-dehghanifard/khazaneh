import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/components/widget/labels/price_label.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

class TransActionHomeItem extends StatelessWidget {
  const TransActionHomeItem({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  final Size size;
  final TransactionEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteAPP.routeAddOrEditTransactionScreen,arguments: item),
      child: Container(
          margin: const EdgeInsets.fromLTRB(12,8,12,4),
          padding: const EdgeInsets.all(8),
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icons
              item.transactionType == TransactionType.receipt?
              const Icon(Icons.keyboard_arrow_up_sharp,size: 28,color: AppColors.greenColor,) :
              const Icon(Icons.keyboard_arrow_down_sharp,size: 28,color: AppColors.redColor,),
              // Transaction title
              SizedBox(
                  width :100,
                  child: Text(
                    item.title,
                    style: AppTextStyle.regularTxtStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
              ),

              Text(item.date,style: AppTextStyle.regularTxtStyle.apply(fontSizeFactor: 0.7)),
              SizedBox(width: size.width / 16),
              SizedBox(
                width: 80,
                child: Text(item.price.separator.withPriceLable,
                    style: AppTextStyle.regularTxtStyle.apply(
                    fontSizeFactor: 0.8,
                    color: item.transactionType == TransactionType.receipt? AppColors.greenColor : AppColors.redColor,),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          )
      ),
    );
  }
}
