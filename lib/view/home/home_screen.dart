// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/items/tranc_action_home_item.dart';
import 'package:khazaneh/components/service/app_service_item2.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/service/app_service_item.dart';
import 'package:khazaneh/constant/routes/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final TransactionController transactionController = Get.put(TransactionController());
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
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
                    // تصویر و متن خوش آمدید
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
               SizedBox(height: size.height / 36),
              //ایتم های برنامه
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "افزودن تراکنش جدید",description: "تراکنش های خودتون رو ذخیره کنید و به راحتی مدیریت کنید!", icon: Assets.icons.creditCard.path, comingSoon: false,color: AppColors.primaryColor, pathUrl: RouteAPP.routeAddOrEditTransactionScreen,data: TransactionEntity() ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SquareAppServicesItem(width: size.width / 2.2,height : size.height / 5.5,title: "لیست تراکنش ها",description: 'لیستی از تراکنش هایی که قبلا اضافه کرده اید را مشاهده کنید', icon: Assets.icons.wallet.path, comingSoon: false,color: AppColors.greenColor, pathUrl: RouteAPP.routeTransactionListScreen,data: null),
                  SquareAppServicesItem(width: size.width / 2.2,height: size.height / 5.5,title: "آمار تراکنش ها",description: 'آمار کامل و دقیق از تراکنش هایی خود را مشاهده کنید!', icon: Assets.icons.financeGrowth.path, comingSoon: false,color: AppColors.yellowColor, pathUrl: RouteAPP.routeTransactionInformationScreen,data: null,),
                ],
              ),
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "مدیریت اقساط",description: 'اقساط ماهانه خود را به سادگی مدیریت کنید!', icon: Assets.icons.wallet.path, comingSoon: true,color: AppColors.redColor, pathUrl: null,data: null,),
              SizedBox(height: size.width * 0.01),

              // پنج تراکنش اخیر
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("تراکنش های اخیر",style: textTheme.bodyText1),
              ),
              ValueListenableBuilder(
                  valueListenable: transactionController.transactionHiveBox.listenable(),
                  builder: (context, box, child) {
                    final items;
                    if(box.values.length >= 5){
                      items = box.values.take(5).toList();
                    } else{
                      items = [];
                    }
                    return SizedBox(
                      width: size.width,
                      height: 150,
                      child: Stack(
                        children: [
                          ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return TransActionHomeItem(size: size, item: item, textTheme: textTheme);
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
                  },
              )
            ],
          ),
        ),
      );
    });
  }
}

