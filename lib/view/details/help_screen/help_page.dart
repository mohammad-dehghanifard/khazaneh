import 'package:flutter/material.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class HelpPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  const HelpPage({required this.imagePath,required this.title,required this.content,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //image
        Center(child: SlideInAnimation(
            animDirection: AxisDirection.right,
            slideAnimDuration: const Duration(milliseconds: 800),
            opacityAnimDuration: const Duration(milliseconds: 600),
            child: Image.asset(imagePath,height: 128)
        )),
        const SizedBox(height: 32),
        // title txt
        SlideInAnimation(
           animDirection: AxisDirection.right,
           slideAnimDuration: const Duration(milliseconds: 800),
           opacityAnimDuration: const Duration(milliseconds: 600),
            child: Text(title,style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.primaryColor))),
        const SizedBox(height: 12),
        // content txt
        SlideInAnimation(
            animDirection: AxisDirection.right,
            slideAnimDuration: const Duration(milliseconds: 1000),
            opacityAnimDuration: const Duration(milliseconds: 600),
            child: Text(content, style: AppTextStyle.subTitleTxtStyle1)),
      ],
    );
  }
}
