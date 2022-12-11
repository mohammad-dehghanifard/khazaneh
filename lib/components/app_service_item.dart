// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';

class AppServicesItem extends StatelessWidget {
  const AppServicesItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.comingSoon,
      required this.pathUrl})
      : super(key: key);
  final title;
  final icon;
  final comingSoon;
  final String? pathUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        pathUrl != null
            ? Get.toNamed(pathUrl!)
            : showSnackBar(title: 'بزودی',content: 'این ویژگی در اپدیت های اینده اضافه خواهد شد!');
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkGrayColor,
            borderRadius: BorderRadius.circular(16)),
        child: comingSoon == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icon,
                    width: 110,
                  ),
                  Text(title),
                  SizedBox(
                    height: Get.height / 80,
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon,
                          width: 110,
                        ),
                        Text(title),
                        SizedBox(
                          height: Get.height / 80,
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                          width: Get.width,
                          height: Get.height,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.shadowColor.withOpacity(0.9)),
                          child: Text(
                            "بزودی....",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 28),
                          ))),
                ],
              ),
      ),
    );
  }
}
