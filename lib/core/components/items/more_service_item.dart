import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MoreServiceItem extends StatelessWidget {
  const MoreServiceItem({
    super.key,
    required this.size,
    required this.icon,
    required this.title,
    required this.route,
    required this.onTap,
  });

  final Size size;
  final IconData icon;
  final String title;
  final String route;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 5),
            BoxShadow(color: AppColors.shadowColor.withOpacity(0.7),blurRadius: 20,inset: true)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: AppColors.greenColor,size: 64),
            SizedBox(height: size.height * 0.02,),
            Text(title,style: AppTextStyle.headlineTxtStyle3.apply(color: AppColors.primaryColor),)
          ],
        ),
      ),
    );
  }
}
