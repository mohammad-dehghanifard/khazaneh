// ignore_for_file: unrelated_type_equality_checks

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:khazaneh/components/bottom_navigation.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/home_screen.dart';
import '../components/app_colors.dart';
import 'transaction_information_screen.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var selectedPageIndex = 0.obs;
    return Obx(
      () {
        return Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(RouteAPP.routeAddOrEditTransactionScreen),
            backgroundColor: AppColors.darkGrayColor,
            child: const Icon(
              CupertinoIcons.add,
              size: 40,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: navigationBottom(selectedPageIndex),
          key: scaffoldKey,
          appBar: selectedPageIndex == 0 ?AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(CupertinoIcons.list_bullet, size: 38),
                      ),
                      const Icon(CupertinoIcons.money_dollar, size: 38),
                      const Icon(CupertinoIcons.info, size: 38),
                    ],
                  ),
                ),
              )
            ],
          ) : null,
          drawer: Drawer(
            backgroundColor: AppColors.darkGrayColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  DrawerHeader(child: Assets.icons.logotest.image()),
                  ListTile(
                    title: Text("درباره برنامه",
                        style: textTheme.headline1!
                            .apply(color: Colors.white)),
                    subtitle: Text(
                      "معرفی برنامه و برنامه نویس خزانه",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8,color: Colors.white),
                    ),
                  ),
                  const Divider(color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("راهنما",
                        style: textTheme.headline1!
                            .apply(color: Colors.white)),
                    subtitle: Text(
                      "راهنمای استفاده از برنامه",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8,color: Colors.white),
                    ),
                  ),
                  const Divider(color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("وب سایت سازنده",
                        style: textTheme.headline1!
                            .apply(color: Colors.white)),
                    subtitle: Text(
                      "مشاهده وب سایت سازنده برنامه",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8,color: Colors.white),
                    ),
                  ),
                  const Divider(color: AppColors.lightGrayColor),
                  ListTile(
                    title: Text("به اشتراک گذاشتن خزانه",
                        style: textTheme.headline1!
                            .apply(color: Colors.white)),
                    subtitle: Text(
                      "خزانه رو با دوستات به اشتراک بزار",
                      style: Theme.of(context).textTheme.subtitle1!.apply(fontSizeFactor: 0.8,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: IndexedStack(
            index: selectedPageIndex.value,
            children:  [
              const HomeScreen(),
              TransactionInformation()
            ],
          ),
        );
      },
    );
  }

}


