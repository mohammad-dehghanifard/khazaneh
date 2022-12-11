import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/view/home_screen.dart';
import '../gen/assets.gen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
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
                  Image.asset("assets/icons/avatar.png",width: 250,):
                  ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.file(File(authController.userImagePath.value),width: 250,fit: BoxFit.cover,)),
                  Positioned(
                    bottom: 15,
                    left: 100,
                    right: 100,
                    child: InkWell(
                      onTap: () => authController.pickAndSaveImage(ImageSource.gallery),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.scaffoldColor,
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          size: 40,
                          color: Colors.white,
                        ),
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
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: theme.subtitle1,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 3.5),
              //Btn
              ElevatedButton(
                  onPressed: () => authController.authSuccess(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
                    child: Text("ثبت نام",),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
