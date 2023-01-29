// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/service/app_service_item.dart';
import 'package:khazaneh/constant/strings/app_strings.dart';
import 'package:khazaneh/components/navigationbtn/bottom_navigation.dart';
import 'package:khazaneh/constant/margin/app_margin.dart';
import 'package:khazaneh/constant/routes/app_route.dart';
import 'package:khazaneh/constant/keys/database_key.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/transactions/add_edit_transaction_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("============${GetStorage().read(DataBaseKey.saveUserImageKey)}==============");
    final HomeController homeController = Get.put(HomeController());
    final UserController userController = Get.put(UserController());
    final size = MediaQuery.of(context).size;
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      border: Border.all(color: AppColors.primaryColor,width: 1.5)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child:  userController.userProfileImagePath.value != "not" ?
                      SizedBox(
                        width: 60,
                        height: 60,
                          child: Image.file(File(userController.userProfileImagePath.value),fit: BoxFit.cover,)):
                      Image.asset(
                        Assets.icons.avatar.path,
                        width: 60,
                      ),
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
               SizedBox(height: size.height / 25),
              //ایتم های برنامه
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "افزودن تراکنش جدید",description: "تراکنش های خودتون رو ذخیره کنید و به راحتی مدیریت کنید!", icon: Assets.icons.creditCard.path, comingSoon: false,color: AppColors.primaryColor, pathUrl: RouteAPP.routeAddOrEditTransactionScreen),
              AppServicesItem(width: size.width / 1,height : size.height / 9.8,title: "لیست تراکنش ها",description: 'لیستی از تراکنش هایی که قبلا اضافه کرده اید را مشاهده کنید', icon: Assets.icons.wallet.path, comingSoon: false,color: AppColors.greenColor, pathUrl: RouteAPP.routeTransactionListScreen),
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "آمار تراکنش ها",description: 'آمار کامل و دقیق از تراکنش هایی خود را مشاهده کنید!', icon: Assets.icons.financeGrowth.path, comingSoon: false,color: AppColors.yellowColor, pathUrl: RouteAPP.routeTransactionInformationScreen),
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "مدیریت اقساط",description: 'اقساط ماهانه خود را به سادگی مدیریت کنید!', icon: Assets.icons.wallet.path, comingSoon: true,color: AppColors.redColor, pathUrl: null),
              SizedBox(height: size.width / 6,)

              // app service item

            ],
          ),
        ),
      );
    });
  }
}

