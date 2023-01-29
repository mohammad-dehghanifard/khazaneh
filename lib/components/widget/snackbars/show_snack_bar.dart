import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';

showSnackBar({required Color backgroundColor,required String title, required String content}) {
  Get.snackbar(
      title,
      content,
      colorText: Colors.white,

      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16)
  );
}