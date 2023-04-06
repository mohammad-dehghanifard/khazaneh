import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/core/components/items/trancaction_home_item.dart';
import 'package:khazaneh/core/components/widget/empty_state/empty_state.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

class LastFiveTransaction extends StatelessWidget {
  const LastFiveTransaction({
    super.key,
    required this.transactionController,
    required this.size,
  });

  final TransactionController transactionController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: transactionController.transactionHiveBox.listenable(),
      builder: (context, box, child) {
        final List<TransactionEntity> items;
        if(box.values.length >= 5){
          items = box.values.take(5).toList();
        } else{
          items = [];
        }
        if(items.length == 5){
          return SizedBox(
            width: size.width,
            height: 150,
            child: Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return TransActionHomeItem(size: size, item: item);
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: size.width,
                    height: 30,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.scaffoldColor,AppColors.scaffoldColor.withOpacity(0.3)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                        )
                    ),
                  ),
                )
              ],
            ),
          );
        } else{
          return const EmptyState(content: "برای فعال شدن این بخش باید پنج تراکنش رو اضافه کنی!",imgSize: 128,);
        }

      },
    );
  }
}

