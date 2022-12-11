import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar({required String title, required String content}) {
  Get.snackbar(
      title,
      content,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16)
  );
}