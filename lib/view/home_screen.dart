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
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final UserController userController = Get.put(UserController());
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // user information card
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child:  homeController.box.read(DataBaseKey.saveUserImageKey) != null ?
                    SizedBox(
                      width: 60,
                      height: 60,
                        child: Image.file(File(userController.userImagePath.value),fit: BoxFit.cover,)):
                    Image.asset(
                      Assets.icons.avatar.path,
                      width: 120,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${userController.userName.value} عزیز ",style: Theme.of(context).textTheme.subtitle1,),
                      const SizedBox(height: 2),
                      Text(
                          "به اپلیکیشن خزانه خوش آمدید!",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 48),

              // app service item
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppServicesItem(title: "افزودن تراکنش جدید",description: "تراکنش های خودتون رو ذخیره کنید و به راحتی مدیریت کنید!", icon: Assets.icons.creditCard.path, comingSoon: false,color: AppColors.primaryColor, pathUrl: RouteAPP.routeAddOrEditTransactionScreen),
                  AppServicesItem(title: "لیست تراکنش ها",description: 'لیستی از تراکنش هایی که قبلا اضافه کرده اید را مشاهده کنید', icon: Assets.icons.wallet.path, comingSoon: false,color: AppColors.greenColor, pathUrl: RouteAPP.routeTransactionListScreen),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppServicesItem(title: "آمار تراکنش ها",description: 'آمار کامل و دقیق از تراکنش هایی خود را مشاهده کنید!', icon: Assets.icons.financeGrowth.path, comingSoon: false,color: AppColors.yellowColor, pathUrl: RouteAPP.routeTransactionInformationScreen),
                  AppServicesItem(title: "مدیریت اقساط",description: 'اقساط ماهانه خود را به سادگی مدیریت کنید!', icon: Assets.icons.wallet.path, comingSoon: true,color: AppColors.redColor, pathUrl: null),
                ],),
            ],
          ),
        ),
      );
    });
  }
}
