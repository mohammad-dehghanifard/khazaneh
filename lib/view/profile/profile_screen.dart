import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/components/widget/bottomsheets/change_username_bottomsheet.dart';
import 'package:khazaneh/core/components/widget/btns/user_option_btn.dart';
import 'package:khazaneh/controller/user/user_controller.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final size = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // user image
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColors.grayColor,
                      borderRadius: BorderRadius.circular(85),
                      border: Border.all(color: AppColors.redColor,width: 2)
                  ),
                  child: userController.userProfileImagePath.value != "not" ? ClipRRect(
                      borderRadius: BorderRadius.circular(85),
                      child: Image.file(File(userController.userProfileImagePath.value),fit: BoxFit.cover))
                      : Image.asset(
                    Assets.icons.avatar.path,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 12),
                // username
                Text(userController.userName.value,style: AppTextStyle.subTitleTxtStyle1),
                // delete profile image btn
                TextButton(
                 onPressed: () => userController.deleteProfileImage(),
                  style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(AppColors.redColor.withOpacity(0.2))
                  ),
                 child:  Text("حذف تصویر پروفایل",style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.redColor,fontSizeFactor: 0.7),)),
                const SizedBox(height: 64),
                const Divider(),
                // change username
                UserOptionBtn(
                    size: size,
                    title: 'ویرایش نام کاربری',
                    content: 'جهت ویرایش نام کاربری خود کلیک کنید.',
                    onTap: () => changeUsernameBottomSheet(context, userController)),
                const Divider(height: 2),
                // change image
                UserOptionBtn(
                    size: size,
                    title: 'تغییر عکس پروفایل',
                    content: 'جهت تغییر تصویر پروفایل خود کلیک کنید.',
                    onTap: () => userController.changeProfileImage(ImageSource.gallery)
                ),
                const Divider(height: 1),

              ],
            ),
          ),
        ),
      );
    });
  }


}


