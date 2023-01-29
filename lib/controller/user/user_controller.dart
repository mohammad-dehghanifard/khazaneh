import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/widget/snackbars/show_snack_bar.dart';
import 'package:khazaneh/constant/keys/database_key.dart';

class UserController extends GetxController{
  final box = GetStorage();
  final TextEditingController changeUserNameController = TextEditingController();
  RxString userName = "${GetStorage().read(DataBaseKey.saveUsernameKey)}".obs;
  RxString userProfileImagePath = "${GetStorage().read(DataBaseKey.saveUserImageKey)}".obs;


  updateUserName(){
    if(changeUserNameController.text.isNotEmpty){
      box.remove(DataBaseKey.saveUsernameKey);
      box.write(DataBaseKey.saveUsernameKey,changeUserNameController.text);
      userName.value = box.read(DataBaseKey.saveUsernameKey);
      changeUserNameController.clear();
      Get.back();
    }else{
      showSnackBar(backgroundColor: AppColors.redColor,title: 'خطا', content: 'لطفا نام کاربری جدید را وارد کنید');
    }
  }
  changeProfileImage(ImageSource imageSource) async{
    final filePicker = await ImagePicker().pickImage(source: imageSource);
    if(filePicker != null){
      box.write(DataBaseKey.saveUserImageKey, filePicker.path);
      userProfileImagePath.value = "${GetStorage().read(DataBaseKey.saveUserImageKey)}";
      showSnackBar(backgroundColor: AppColors.greenColor,title: 'عملیات موفق',content: 'تصویر پروفایل شما با موفقیت تعویض گردید.در صورت عدم تعویض عکس برنامه را بسته و مجدد اجرا کنید!');
    }else{
      showSnackBar(backgroundColor: AppColors.redColor,title: 'خطا',content: 'شما هیچ عکسی انتخاب نکرده اید!');
    }

  }
  deleteProfileImage() {
    box.remove(DataBaseKey.saveUserImageKey);
    box.write(DataBaseKey.saveUserImageKey,'not');
    userProfileImagePath.value = "not";
  }
}