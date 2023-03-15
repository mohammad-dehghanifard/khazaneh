// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/core/components/items/trancaction_home_item.dart';
import 'package:khazaneh/core/components/service/square_app_service_item.dart';
import 'package:khazaneh/core/components/widget/empty_state/empty_state.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/components/service/app_service_item.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final TransactionController transactionController = Get.put(TransactionController());
    final size = MediaQuery.of(context).size;

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
                      Text("${userController.userName.value} عزیز ",style: AppTextStyle.subTitleTxtStyle1),
                      const SizedBox(height: 2),
                      Text(
                          "به اپلیکیشن خزانه خوش آمدید!",
                          style: AppTextStyle.subTitleTxtStyle1
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
                  SquareAppServicesItem(width: size.width / 2.2,height : size.height / 7.6,title: "لیست تراکنش ها", icon: Assets.icons.wallet.path, comingSoon: false,color: AppColors.greenColor, pathUrl: RouteAPP.routeTransactionListScreen,data: null),
                  SquareAppServicesItem(width: size.width / 2.2,height: size.height / 7.6,title: "آمار تراکنش ها", icon: Assets.icons.financeGrowth.path, comingSoon: false,color: AppColors.yellowColor, pathUrl: RouteAPP.routeTransactionInformationScreen,data: null,),
                ],
              ),
              AppServicesItem(width: size.width / 1,height: size.height / 9.8,title: "سایر خدمات",description: 'مدیریت اقساط، محسابه سود،سیستم محسابه دنگ و...', icon: Assets.icons.money.path, comingSoon: true,color: AppColors.redColor, pathUrl: null,data: null,),
              SizedBox(height: size.width * 0.01),

              // پنج تراکنش اخیر
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("تراکنش های اخیر",style: AppTextStyle.regularTxtStyle),
              ),
              ValueListenableBuilder(
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
              ),
              SizedBox(height: size.height * 0.20)
            ],
          ),
        ),
      );
    });
  }
}

