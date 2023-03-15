import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/controller/navigation/navigation_controller.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

class NavigationBottomWidget extends StatelessWidget {
  NavigationBottomWidget({Key? key}) : super(key: key);
  final NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 30,
            right: 40,
            left: 40,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      navigationController.selectedScreen.value = 0;
                    },
                    icon: const Icon(CupertinoIcons.house,size: 30,color: AppColors.textColor), ),
                  IconButton(
                    onPressed: () {
                      navigationController.selectedScreen.value = 1;
                    },
                    icon: const Icon(CupertinoIcons.person_fill,size: 32,color: AppColors.textColor), )
                ],
              ),

            ),
          ),
          Center(
            child: InkWell(
              onTap: () => Get.toNamed(RouteAPP.routeAddOrEditTransactionScreen,arguments: TransactionEntity()),
              child: Container(
                width: 65,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:  const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.primaryColor,
                            blurRadius: 20,
                            offset: Offset(0, 10)
                        )
                      ]
                  ),
                  child: const Icon(Icons.add,color: Colors.white,size: 26,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}