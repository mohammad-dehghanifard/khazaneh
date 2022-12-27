import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/components/app_colors.dart';

showSnackBar({required String title, required String content}) {
  Get.snackbar(
      title,
      content,
      colorText: Colors.white,

      backgroundColor: AppColors.redColor,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16)
  );
}