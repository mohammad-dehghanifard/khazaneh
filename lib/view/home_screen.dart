// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_service_item.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/bottom_navigation.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // user information card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 36),
              width: Get.width,
              height: Get.height / 4,
              decoration: BoxDecoration(
                  color: AppColors.darkGrayColor,
                  borderRadius: BorderRadius.circular(35)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child:  homeController.box.read(DataBaseKey.saveUserImageKey) != null ?
                    Image.file(File(homeController.loadUserImage()),width: 150,fit: BoxFit.cover,):
                    Image.asset(
                      Assets.icons.avatar.path,
                      width: 120,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(homeController.loadUserName()),
                      const SizedBox(height: 8),
                      Text(
                        "تعداد تراکنش ها : 0",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .apply(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),

            // app service item
            SizedBox(
              width: Get.width,
              height: Get.height / 2.2,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: [
                  AppServicesItem(
                    title: AppStrings.recordTransactionTxt,
                    icon: Assets.icons.creditCard.path,
                    comingSoon: false,
                    pathUrl: RouteAPP.routeAddOrEditTransactionScreen,
                  ),
                  AppServicesItem(
                      title: AppStrings.transactionListTxt,
                      icon: Assets.icons.wallet.path,
                      comingSoon: false,
                      pathUrl: RouteAPP.routeTransactionListScreen,
                  ),
                  AppServicesItem(
                      title: AppStrings.statisticsTxt,
                      icon: Assets.icons.financeGrowth.path,
                      comingSoon: false,
                      pathUrl: RouteAPP.routeTransactionInformationScreen,
                  ),
                  AppServicesItem(
                      title: "مدیریت اقساط",
                      icon: Assets.icons.money.path,
                      comingSoon: true,
                      pathUrl: null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
