import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/gen/fonts.gen.dart';

AppBar secondaryAppBar({required String pageTitle}) {
  const defaultFontFamily = FontFamily.iranSans;
  return AppBar(
    backgroundColor: Colors.transparent,
    title: SlideInAnimation(
        animDirection: AxisDirection.left,
        slideAnimDuration: const Duration(milliseconds: 1300),
        opacityAnimDuration: const Duration(milliseconds: 1000),
        child: Text(pageTitle,style: const TextStyle(color: Colors.black,fontFamily: defaultFontFamily),)),
    centerTitle: true,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            InkWell(
                onTap: () => Get.back(),
                child: const SlideInAnimation(
                    animDirection: AxisDirection.right,
                    slideAnimDuration:  Duration(milliseconds: 1300),
                    opacityAnimDuration:  Duration(milliseconds: 1000),
                    child:  Icon(Icons.arrow_forward_ios, size: 22,color: Colors.black,))
            ),
          ],
        ),
      )
    ],
  );
}