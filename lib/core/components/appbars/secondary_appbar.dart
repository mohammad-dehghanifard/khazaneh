import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/gen/fonts.gen.dart';

AppBar secondaryAppBar({required String pageTitle}) {
  const defaultFontFamily = FontFamily.iranSans;
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(pageTitle,style: const TextStyle(color: Colors.black,fontFamily: defaultFontFamily),),
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
                child: const Icon(Icons.arrow_forward_ios, size: 22,color: Colors.black,)
            ),
          ],
        ),
      )
    ],
  );
}