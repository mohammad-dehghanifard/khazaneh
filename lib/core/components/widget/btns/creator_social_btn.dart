import 'package:flutter/material.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class CreatorSocialBtn extends StatelessWidget {
  const CreatorSocialBtn({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTap
  }) : super(key: key);

  final Color color;
  final String icon;
  final String title;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),

      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(icon,width: 42,color: Colors.white,),
            const SizedBox(height: 12),
            Text(title,style: AppTextStyle.subTitleTxtStyle1.apply(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
