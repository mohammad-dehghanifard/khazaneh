import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/home_screen.dart';
import 'package:khazaneh/view/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
   Future.delayed(const Duration(seconds: 5)).then((value) => userController.box.read(DataBaseKey.saveUsernameKey) == null?
    Get.offAndToNamed(RouteAPP.routeRegisterScreen):
    Get.offAndToNamed(RouteAPP.routeMainScreen)
   );
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
              const SizedBox(),
              Image.asset(Assets.icons.khazanehlogo.path),
              const SpinKitFadingCube(size: 30,color: AppColors.primaryColor,),
               Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(AppStrings.appVersionTxt,style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
