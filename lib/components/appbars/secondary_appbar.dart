import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

AppBar secondaryAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Icon(CupertinoIcons.money_dollar, size: 38),
              InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(CupertinoIcons.arrow_left, size: 38)
              ),
            ],
          ),
        ),
      )
    ],
  );
}