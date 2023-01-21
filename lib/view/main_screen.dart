// ignore_for_file: unrelated_type_equality_checks

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:khazaneh/components/bottom_navigation.dart';
import 'package:khazaneh/components/widget/navigation_bottom_widget.dart';
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/controller/navigation/navigation_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/home_screen.dart';
import 'package:khazaneh/view/profile_screen.dart';
import '../components/app_colors.dart';
import 'transaction_information_screen.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class MainScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
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
              IconButton(
                  onPressed:() {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(CupertinoIcons.list_bullet_indent,color: AppColors.primaryColor,) ),
              Expanded(child: SizedBox(width: MediaQuery.of(context).size.width,)),
              IconButton(
                  onPressed: () => Get.toNamed(RouteAPP.routeHelpScreen),
                  icon: const Icon(Icons.help_sharp,size: 28,color: AppColors.redColor,) ),
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
                        style: textTheme.bodyText2),
                    subtitle: Text(
                      "مشاهده لیست کامل تراکنش ها",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.routeTransactionListScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("آمار تراکنش ها",
                        style: textTheme.bodyText2),
                    subtitle: Text(
                      "مشاهده آمار کامل تراکنش های اضافه شده",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.routeTransactionInformationScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor,height: 1,),
                  ListTile(
                    title: Text("درباره برنامه",
                        style: textTheme.bodyText2),
                    subtitle: Text(
                      "معرفی برنامه و برنامه نویس خزانه",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => Get.toNamed(RouteAPP.creatorMainScreen),
                  ),
                  const Divider(color: AppColors.lightGrayColor,height: 0.9,),
                  ListTile(
                    title: Text("اشتراک گذاری",
                        style: textTheme.bodyText2),
                    subtitle: Text(
                      "خزانه رو به دوستات معرفی کن",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
                    ),
                    onTap: () => homeController.shareApp(),
                  ),
                  const Divider(height: 0.5,color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("راهنما",
                        style: textTheme.bodyText2),
                    subtitle: Text(
                      "راهنمای استفاده از برنامه",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
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





