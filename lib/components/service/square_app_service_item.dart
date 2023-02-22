// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/constant/colors/app_colors.dart';
import 'package:khazaneh/components/widget/snackbars/show_snack_bar.dart';

class SquareAppServicesItem extends StatelessWidget {
  const SquareAppServicesItem(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.icon,
      required this.comingSoon,
      required this.color,
      required this.pathUrl,
      required this.data})
      : super(key: key);
  final double width;
  final double height;
  final title;
  final icon;
  final comingSoon;
  final Color color;
  final String? pathUrl;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // service Icon
                children: [
                  Image.asset(
                    icon,
                    width: 68,
                  ),
                  const SizedBox(width: 2),
                  Text(title,style: textTheme.bodyText2!.apply(color: Colors.white),),
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
                              Text(title,style: textTheme.bodyText2!.apply(color: Colors.white),),
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

