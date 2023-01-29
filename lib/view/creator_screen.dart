import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/components/app_colors.dart';
import 'package:khazaneh/components/app_strings.dart';
import 'package:khazaneh/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/components/widget/creator_social_btn.dart';
import 'package:khazaneh/controller/creator/creator_controller.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class CreatorScreen extends StatelessWidget {
  final CreatorController creatorController = Get.put(CreatorController());
   CreatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: secondaryAppBar(pageTitle: 'سازنده برنامه'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              //image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayColor,
                  border: Border.all(color: AppColors.redColor,width: 2)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(64),
                    child: Image.asset(Assets.images.cratorimage.path)),
              ),
              const SizedBox(height: 16),
              //title
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
              // social media icon
              Padding(
                padding: const EdgeInsets.fromLTRB(16,22,16,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),
              ),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}

