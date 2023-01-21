import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/components/widget/change_username_bottomsheet.dart';
import 'package:khazaneh/components/widget/user_option_btn.dart';
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: Center(
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(85),
                    border: Border.all(color: AppColors.redColor,width: 2)
                ),
                child: userController.box.read(DataBaseKey.saveUserImageKey) != null ? ClipRRect(
                    borderRadius: BorderRadius.circular(85),
                    child: Image.file(File(userController.userImagePath()),fit: BoxFit.cover))
                    : Image.asset(
                  Assets.icons.avatar.path,
                  width: 150,
                ),
              ),
              const SizedBox(height: 12),
              Text(userController.userName.value,style: textTheme.subtitle1),
              TextButton(
               onPressed: () => userController.deleteProfileImage(),
                style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(AppColors.redColor.withOpacity(0.2))
                ),
               child:  Text("حذف تصویر پروفایل",style: textTheme.headline5!.apply(color: AppColors.redColor,fontSizeFactor: 0.7),)),
              const SizedBox(height: 64),
              const Divider(),
              UserOptionBtn(
                  size: size,
                  title: 'ویرایش نام کاربری',
                  content: 'جهت ویرایش نام کاربری خود کلیک کنید.',
                  onTap: () {
                    changeUsernameBottomSheet(context, userController);
                  },
                  textTheme: textTheme),
              const Divider(height: 2),
              UserOptionBtn(
                  size: size,
                  title: 'تغییر عکس پروفایل',
                  content: 'جهت تغییر تصویر پروفایل خود کلیک کنید.',
                  onTap: () {
                     userController.changeProfileImage(ImageSource.gallery);
                     userController.userImagePath.value == userController.box.read(DataBaseKey.saveUserImageKey);
                  },
                  textTheme: textTheme),
              const Divider(height: 1),

            ],
          ),
        ),
      );
    });
  }


}


