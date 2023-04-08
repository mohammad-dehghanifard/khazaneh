// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/components/widget/btns/navigation_bottom_widget.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/controller/navigation/navigation_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/home/home_screen.dart';
import 'package:khazaneh/view/profile/profile_screen.dart';
import '../../core/constant/colors/app_colors.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class MainScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(NavigationController());
    return Obx(
      () {
        return Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          key: scaffoldKey,
          appBar:AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              SlideInAnimation(
                animDirection: AxisDirection.left,
                slideAnimDuration: const Duration(milliseconds: 1300),
                opacityAnimDuration: const Duration(milliseconds: 1000),
                child: IconButton(
                    onPressed:() {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(CupertinoIcons.list_bullet_indent,color: AppColors.primaryColor,) ),
              ),
              Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
              SlideInAnimation(
                animDirection: AxisDirection.right,
                slideAnimDuration: const Duration(milliseconds: 1300),
                opacityAnimDuration: const Duration(milliseconds: 1000),
                child: IconButton(
                    onPressed: () => Get.toNamed(RouteAPP.routeHelpScreen),
                    icon: const Icon(Icons.help_sharp,size: 28,color: AppColors.redColor,) ),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: AppColors.scaffoldColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  DrawerHeader(child: Image.asset(Assets.icons.khazanehlogo.path)),
                  ListTile(
                    title: Text("لیست تراکنش ها",
                        style: AppTextStyle.defaultTxtStyle),
                    subtitle: Text(
                      "مشاهده لیست کامل تراکنش ها",
                      style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.routeTransactionListScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("آمار تراکنش ها",
                        style: AppTextStyle.defaultTxtStyle),
                    subtitle: Text(
                      "مشاهده آمار کامل تراکنش های اضافه شده",
                      style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.routeTransactionInformationScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor,height: 1,),
                  ListTile(
                    title: Text("درباره برنامه",
                        style: AppTextStyle.defaultTxtStyle),
                    subtitle: Text(
                      "معرفی برنامه و برنامه نویس خزانه",
                      style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.creatorMainScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor,height: 0.9,),
                  ListTile(
                    title: Text("اشتراک گذاری",
                        style: AppTextStyle.defaultTxtStyle),
                    subtitle: Text(
                      "خزانه رو به دوستات معرفی کن",
                      style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => homeController.shareApp(),
                  ),
                  const Divider(height: 0.5,color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("راهنما",
                        style: AppTextStyle.defaultTxtStyle),
                    subtitle: Text(
                      "راهنمای استفاده از برنامه",
                      style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.routeHelpScreen),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: IndexedStack(
                  index: navigationController.selectedScreen.value,
                  children: const [
                    HomeScreen(),
                    ProfileScreen()
                  ],
                ),
              ),
               Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: NavigationBottomWidget())
            ],
          ),
        );
      },
    );
  }

}





