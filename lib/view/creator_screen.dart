import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/controller/creator/creator_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class CreatorScreen extends StatelessWidget {
  final CreatorController creatorController = Get.put(CreatorController());
   CreatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: secondaryAppBar(pageTitle: 'سازنده برنامه'),
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grayColor,
                border: Border.all(color: AppColors.redColor,width: 2)
              ),
            ),
            const SizedBox(height: 16),
            RichText(
                text: TextSpan(
                    text: 'محمد دهقانی فرد',
                    style: textTheme.bodyText2,
                    children: [
                      TextSpan(
                        text: ' /برنامه نویس موبایل',
                        style: textTheme.subtitle1!.apply(fontSizeFactor: 0.8)
                      )
                    ]
                ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppStrings.creatorDescription,
                style: textTheme.subtitle2,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 16,),
            const Text('ارتباط با من'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreatorSocialBtn(
                    textTheme: textTheme,
                    color: AppColors.redColor,
                    title: 'وب سایت',
                    icon: Assets.icons.mywebsite.path,
                    onTap: () => creatorController.lunchUrl(url: 'https://dehghanifard.ir'),
                ),
                CreatorSocialBtn(
                    textTheme: textTheme,
                    color: AppColors.primaryColor,
                    title: 'تلگرام',
                    icon: Assets.icons.telegram.path,
                    onTap: () => creatorController.lunchUrl(url: 'https://t.me/Mohammad_df'),
                ),
                CreatorSocialBtn(
                    textTheme: textTheme,
                    color: AppColors.yellowColor,
                    title: 'اینستاگرام',
                    icon: Assets.icons.instagram.path,
                    onTap: () => creatorController.lunchUrl(url: 'https://www.instagram.com/m.deghanifard/'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CreatorSocialBtn extends StatelessWidget {
  const CreatorSocialBtn({
    Key? key,
    required this.textTheme,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTap
  }) : super(key: key);

  final TextTheme textTheme;
  final Color color;
  final String icon;
  final String title;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
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
            Text(title,style: textTheme.subtitle1!.apply(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
