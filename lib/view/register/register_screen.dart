import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/constant/keys/database_key.dart';
import 'package:khazaneh/controller/auth/auth_controller.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              authController.userImagePath.isEmpty?
              Container(
                width: size.width / 2.5,
                height: size.height / 4,
                decoration: BoxDecoration(
                  color: AppColors.grayColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.redColor,width: 2)
                ),
                  ):
              SizedBox(
                width: size.width / 2,
                height: size.height / 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: Image.file(File(authController.userImagePath.value),fit: BoxFit.cover,)),
              ),
             TextButton(
               onPressed: () => authController.pickAndSaveImage(ImageSource.gallery),
               style: ButtonStyle(
                 overlayColor: MaterialStatePropertyAll(AppColors.redColor.withOpacity(0.2))
               ),
               child: Text(AppStrings.selectImageTxt,style: AppTextStyle.regularTxtStyle.apply(color: AppColors.redColor),),),
              const SizedBox(height: 36),
              // Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: authController.usernameController,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: AppTextStyle.subTitleTxtStyle1,
                    prefixIcon: const Icon(CupertinoIcons.person_alt_circle,color: AppColors.primaryColor,size: 32,)
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
                      if(authController.userImagePath.value != ''){
                        userController.userProfileImagePath.value = userController.box.read(DataBaseKey.saveUserImageKey);
                      }else{
                        userController.box.write(DataBaseKey.saveUserImageKey, "not");
                        userController.userProfileImagePath.value = "not";
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(Get.width,50))
                    ),
                    child: Text("ثبت نام",style: AppTextStyle.defaultTxtStyle.apply(color: Colors.white,fontSizeFactor: 1.4),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
