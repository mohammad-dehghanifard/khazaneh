import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/constant/routes/app_route.dart';

Widget navigationBottom(RxInt selectedPageIndex) {
  return AnimatedBottomNavigationBar(
    onTap: (index) {
      selectedPageIndex.value = index;
    },
    icons: const [
      CupertinoIcons.home,
      CupertinoIcons.chart_bar_alt_fill,
    ],
    splashColor: AppColors.scaffoldColor,
    backgroundColor: AppColors.darkGrayColor,
    activeColor: AppColors.navBarBtnActiveColor,
    inactiveColor: Colors.white,
    activeIndex: selectedPageIndex.value,
    notchSmoothness: NotchSmoothness.softEdge,
    leftCornerRadius: 24,
    rightCornerRadius: 24,
    gapLocation: GapLocation.center,
  );
}

