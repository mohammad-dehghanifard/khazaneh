import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/widget/snackbars/show_snack_bar.dart';
import 'package:khazaneh/constant/routes/app_route.dart';
import 'package:khazaneh/constant/keys/database_key.dart';

class AuthController extends GetxController{
  final TextEditingController usernameController = TextEditingController();
  final RxString userImagePath = ''.obs;
  final box = GetStorage();


  pickAndSaveImage(ImageSource imageSource) async{
      final filePicker = await ImagePicker().pickImage(source: imageSource);
      if(filePicker != null){
        userImagePath.value = filePicker.path;
        box.write(DataBaseKey.saveUserImageKey, userImagePath.value);
        showSnackBar(backgroundColor: AppColors.greenColor,title: 'عملیات موفق',content: 'تصویر پروفایل شما با موفقیت انتخاب شد!');

      }else{
        showSnackBar(backgroundColor: AppColors.redColor,title: 'خطا',content: 'شما هیچ عکسی انتخاب نکرده اید!');
      }
  }
  saveUserName(String username){
    box.write(DataBaseKey.saveUsernameKey, username);
  }
  authSuccess(){

    if(usernameController.text.isEmpty){
      showSnackBar(backgroundColor: AppColors.redColor,title: 'خطا',content: 'شما نام کاربری خود را وارد نکرده اید!');
    }else{
      saveUserName(usernameController.text);
      Get.offNamed(RouteAPP.routeMainScreen);

    }

  }

}

