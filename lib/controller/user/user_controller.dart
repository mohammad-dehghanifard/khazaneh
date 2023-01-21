import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';
import 'package:khazaneh/constant/database_key.dart';

class UserController extends GetxController{
  final box = GetStorage();
  final TextEditingController changeUserNameController = TextEditingController();
  RxString userName = "${GetStorage().read(DataBaseKey.saveUsernameKey)}".obs;
  RxString userImagePath = '${GetStorage().read(DataBaseKey.saveUserImageKey)}'.obs;


  updateUserName(){
    if(changeUserNameController.text.isNotEmpty){
      box.remove(DataBaseKey.saveUsernameKey);
      box.write(DataBaseKey.saveUsernameKey,changeUserNameController.text);
      userName.value = box.read(DataBaseKey.saveUsernameKey);
      changeUserNameController.clear();
      Get.back();
    }else{
      showSnackBar(title: 'خطا', content: 'لطفا نام کاربری جدید را وارد کنید');
    }
  }
  changeProfileImage(ImageSource imageSource) async{
    final filePicker = await ImagePicker().pickImage(source: imageSource);
    if(filePicker != null){
      box.remove(DataBaseKey.saveUserImageKey);
      userImagePath.value = filePicker.path;
      box.write(DataBaseKey.saveUserImageKey, userImagePath.value);
    }else{
      showSnackBar(title: 'خطا',content: 'شما هیچ عکسی انتخاب نکرده اید!');
    }
  }
  deleteProfileImage() {
    box.remove(DataBaseKey.saveUserImageKey);
    userImagePath.value = "";
  }

}