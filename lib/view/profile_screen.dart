import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/controller/user/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final textTheme = Theme.of(context).textTheme;
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
                child: userController.userImagePath.value.isNotEmpty? ClipRRect(
                    borderRadius: BorderRadius.circular(85),
                    child: Image.file(File(userController.userImagePath()),fit: BoxFit.cover))
                    : null,
              ),
              const SizedBox(height: 12),
              Text(userController.userName.value,style: textTheme.subtitle1),
              const SizedBox(height: 64),
              UserOptionBtn(
                  title: 'ویرایش نام کاربری',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)
                          )
                      ),
                      builder: (context) {
                        return Padding(
                          padding:  EdgeInsets.only(bottom:  MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text('ویرایش نام کاربری'),
                              ),
                              const SizedBox(height: 100),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: userController.changeUserNameController,
                                  decoration: const InputDecoration(
                                      hintText: 'نام کاربری جدید را وارد کنید'
                                  ),
                                ),
                              ),
                              const SizedBox(height: 190),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton(
                                    onPressed: () => userController.updateUserName(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('ذخیره تغیرات',style: Theme.of(context).textTheme.bodyText2!.apply(fontSizeFactor: 1.5,color: Colors.white),),
                                    )
                                ),
                              ),
                            ],
                          ),
                        );
                      },);
                  },
                  textTheme: textTheme),
              const SizedBox(height: 16),
              UserOptionBtn(
                  title: 'تغییر عکس پروفایل',
                  onTap: () => userController.changeProfileImage(ImageSource.gallery),
                  textTheme: textTheme),
            ],
          ),
        ),
      );
    });
  }
}

class UserOptionBtn extends StatelessWidget {
  const UserOptionBtn({
    Key? key,
    required this.title,
    required this.onTap,
    required this.textTheme,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            minimumSize: MaterialStatePropertyAll(Size(Get.width,52))
          ),
          child: Text(title,style: textTheme.bodyText2!.apply(color: AppColors.primaryColor),)),
    );
  }
}

