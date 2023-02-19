import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

class TransActionHomeItem extends StatelessWidget {
  const TransActionHomeItem({
    Key? key,
    required this.size,
    required this.item,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TransactionEntity item;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const SizedBox(width: 12),
            SizedBox(
                width :100,
                child: Text(
                  item.title,
                  style: textTheme.bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                )
            ),
            SizedBox(width: size.width / 2.8),
            Text(item.date,style: textTheme.bodyText1),

          ],
        )
    );
  }
}
