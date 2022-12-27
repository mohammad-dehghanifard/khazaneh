// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/widget/show_snack_bar.dart';
import 'package:khazaneh/constant/app_margin.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class AppServicesItem extends StatelessWidget {
  const AppServicesItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      required this.comingSoon,
        required this.color,
      required this.pathUrl})
      : super(key: key);
  final title;
  final description;
  final icon;
  final comingSoon;
  final Color color;
  final String? pathUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        pathUrl != null
            ? Get.toNamed(pathUrl!)
            : showSnackBar(title: 'بزودی',content: 'این ویژگی در اپدیت های اینده اضافه خواهد شد!');
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 194,
        height: 217,
        padding:  EdgeInsets.symmetric(horizontal: comingSoon!? 0  :8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16)),
        child: comingSoon == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(child: SizedBox(width: Get.width,)),
                      Image.asset(
                        icon,
                        width: 90,
                      ),
                    ],
                  ),
                  Text(title,style: textTheme.bodyText2!.apply(color: Colors.white),),
                  const SizedBox(height: 6,),
                  Text(description,style: textTheme.subtitle1!.apply(color: Colors.white,fontSizeFactor: 0.9),),

                ],
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(child: SizedBox(width: Get.width,)),
                              Image.asset(
                                icon,
                                width: 90,
                              ),
                            ],
                          ),
                          Text(title,style: textTheme.bodyText2!.apply(color: Colors.white),),
                          const SizedBox(height: 6,),
                          Text(description,style: textTheme.subtitle1!.apply(color: Colors.white,fontSizeFactor: 0.9),),

                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: 194,
                      height: 217,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.textColor.withOpacity(0.8)),
                      child: Text(
                        "بزودی....",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 28,color: Colors.white),
                      )),
                ],
              ),
      ),
    );
  }
}

