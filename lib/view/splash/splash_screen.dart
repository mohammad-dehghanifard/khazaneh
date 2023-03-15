import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/core/constant/keys/database_key.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';


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
                child: Text(AppStrings.appVersionTxt,style: AppTextStyle.regularTxtStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
