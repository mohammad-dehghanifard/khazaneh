import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:khazaneh/components/app_colors.dart';

class UserOptionBtn extends StatelessWidget {
  const UserOptionBtn({
    Key? key,
    required this.title,
    required this.onTap,
    required this.textTheme,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              minimumSize: MaterialStatePropertyAll(Size(Get.width,52))
          ),
          child: Text(title,style: textTheme.bodyText2!.apply(color: AppColors.primaryColor),)),
    );
  }
}
