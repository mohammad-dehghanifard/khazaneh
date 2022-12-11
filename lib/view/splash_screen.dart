import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/home_screen.dart';
import 'package:khazaneh/view/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) => Get.offAndToNamed(RouteAPP.routeRegisterScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Assets.icons.logotest.path),
              const SpinKitRotatingCircle(size: 60,color: AppColors.darkGrayColor,),
               Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(AppStrings.appVersionTxt,style: Theme.of(context).textTheme.bodyText1,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
