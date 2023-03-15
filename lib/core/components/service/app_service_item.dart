// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/components/widget/snackbars/show_snack_bar.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';


class AppServicesItem extends StatelessWidget {
  const AppServicesItem(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.description,
      required this.icon,
      required this.comingSoon,
      required this.color,
      required this.pathUrl,
      required this.data})
      : super(key: key);
  final double width;
  final double height;
  final title;
  final description;
  final icon;
  final comingSoon;
  final Color color;
  final String? pathUrl;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        pathUrl != null
            ? Get.toNamed(pathUrl!,arguments: data)
            : showSnackBar(backgroundColor: AppColors.primaryColor,title: 'بزودی',content: 'این ویژگی در اپدیت های اینده اضافه خواهد شد!');
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(9,0,9,16),
        width: width,
        height: height,
        padding:  EdgeInsets.symmetric(horizontal: comingSoon!? 0  :8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)),
        child: comingSoon == false
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // service Icon
                children: [
                  Image.asset(
                    icon,
                    width: 60,
                  ),
                  const SizedBox(width: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(title,style: AppTextStyle.defaultTxtStyle.apply(color: Colors.white),),
                      const SizedBox(height: 3,),
                      SizedBox(
                          width: size.width / 1.4,
                          height: size.height / 16,
                          child: Text(description,style: AppTextStyle.regularTxtStyle.apply(color: Colors.white,fontSizeFactor: 0.8),)),
                      //const SizedBox(height: 4,),
                    ],
                  )
                ],
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // service Icon
                        children: [
                          Image.asset(
                            icon,
                            width: 60,
                          ),
                          const SizedBox(width: 4),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,style: AppTextStyle.defaultTxtStyle.apply(color: Colors.white),),
                              const SizedBox(height: 6,),
                              Text(description,style: AppTextStyle.regularTxtStyle.apply(color: Colors.white,fontSizeFactor: 0.8),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: width,
                      height: height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.textColor.withOpacity(0.8)),
                      child: Text(
                        "بزودی....",
                        style: AppTextStyle.defaultTxtStyle.copyWith(fontSize: 28,color: Colors.white),
                      )),
                ],
              ),
      ),
    );
  }
}

