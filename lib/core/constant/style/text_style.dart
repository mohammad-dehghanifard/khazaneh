import 'package:flutter/material.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/gen/fonts.gen.dart';

class AppTextStyle{
  AppTextStyle._();

  static String defaultFontFamily = FontFamily.iranSans;

  static TextStyle defaultTxtStyle = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor);
  static TextStyle regularTxtStyle = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: AppColors.textColor);
  static TextStyle headlineTxtStyle1 = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );
  static TextStyle headlineTxtStyle2 = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static TextStyle headlineTxtStyle3 = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor);
  static TextStyle subTitleTxtStyle1 = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: AppColors.lightGrayColor);
  static TextStyle buttonTxtStyle = TextStyle(
    fontFamily: defaultFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle captionTxtStyle = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: AppColors.lightGrayColor
  );
  static TextStyle calculateBtnTxtStyle = TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor);


}
