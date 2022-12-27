import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

import '../components/items/transaction_listItem.dart';

class TransactionListScreen extends StatelessWidget {
  TransactionListScreen({Key? key}) : super(key: key);
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteAPP.routeAddOrEditTransactionScreen),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(CupertinoIcons.add,size: 26),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: secondaryAppBar(pageTitle: 'لیست تراکنش ها'),
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            //Transaction List
            SizedBox(
              height: Get.height / 1.3,
              child: ValueListenableBuilder(
                valueListenable: transactionController.transactionHiveBox.listenable(),
                builder: (context, box, child) {
                  final items = box.values.toList();
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return TransactionListItem(textTheme: textTheme, transactionEntity: item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
