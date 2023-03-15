import 'package:flutter/material.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class UserOptionBtn extends StatelessWidget {
  const UserOptionBtn({
    Key? key,
    required this.size,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String content;
  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(title,style: AppTextStyle.regularTxtStyle),
               const SizedBox(height: 8),
               Text(content,style: AppTextStyle.subTitleTxtStyle1.apply(fontSizeFactor: 0.9)),
             ],
           ),
           const Icon(Icons.arrow_forward_ios,color: AppColors.lightGrayColor),
          ],
        ),
      ),
    );
  }
}

