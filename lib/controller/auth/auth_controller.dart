import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';

class AuthController extends GetxController{
  final TextEditingController usernameController = TextEditingController(text: 'محمد دهقانی فرد');
  final RxString userImagePath = ''.obs;
  final box = GetStorage();


  pickAndSaveImage(ImageSource imageSource) async{
      final filePicker = await ImagePicker().pickImage(source: imageSource);
      if(filePicker != null){
        userImagePath.value = filePicker.path;
        box.write(DataBaseKey.saveUserImageKey, userImagePath.value);
      }else{
        showSnackBar(title: 'خطا',content: 'شما هیچ عکسی انتخاب نکرده اید!');
      }
  }
  saveUserName(String username){
    box.write(DataBaseKey.saveUsernameKey, username);
  }
  authSuccess(){

    if(usernameController.text.isEmpty){
      showSnackBar(title: 'خطا',content: 'شما نام کاربری خود را وارد نکرده اید!');
    }else{
      saveUserName(usernameController.text);
      Get.offNamed(RouteAPP.routeMainScreen);
    }

  }

}

