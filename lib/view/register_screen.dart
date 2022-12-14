import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/view/home_screen.dart';
import '../gen/assets.gen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          ()=> Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 84,
              ),
              // avatar image
              Stack(
                children: [
                  authController.userImagePath.isEmpty?
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: AppColors.grayColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.redColor,width: 2)
                    ),
                      ):
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.file(File(authController.userImagePath.value),fit: BoxFit.cover,)),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 100,
                    right: 100,
                    child: InkWell(
                      onTap: () => authController.pickAndSaveImage(ImageSource.gallery),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 40,

                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                AppStrings.selectImageTxt,
              ),
              const SizedBox(height: 36),
              // Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: authController.usernameController,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: "?????? ?? ?????? ????????????????",
                    hintStyle: textTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 3.5),
              //Btn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    onPressed: () {
                      authController.authSuccess();
                      userController.userName.value = userController.box.read(DataBaseKey.saveUsernameKey);
                      userController.userImagePath.value = userController.box.read(DataBaseKey.saveUserImageKey);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(Get.width,50))
                    ),
                    child: Text("?????? ??????",style: textTheme.bodyText2!.apply(color: Colors.white,fontSizeFactor: 1.4),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
