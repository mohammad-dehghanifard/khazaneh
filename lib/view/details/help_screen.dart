import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: secondaryAppBar(pageTitle: 'راهنمای استفاده از نرم افزار'),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('افزودن تراکنش جدید',style: textTheme.headline5!.apply(color: AppColors.primaryColor)),
              const SizedBox(height: 4),
              Text(AppStrings.addTransactionHelpTxt,style: textTheme.subtitle1),
              const SizedBox(height: 32),

              Text('لیست تراکنش ها',style: textTheme.headline5!.apply(color: AppColors.primaryColor)),
              const SizedBox(height: 4),
              Text(AppStrings.transactionListHelpTxt,style: textTheme.subtitle1,textAlign: TextAlign.justify,),
              const SizedBox(height: 32),

              Text('آمار تراکنش ها',style: textTheme.headline5!.apply(color: AppColors.primaryColor)),
              const SizedBox(height: 4),
              Text(AppStrings.transactionInformationHelpTxt,style: textTheme.subtitle1,textAlign: TextAlign.justify),
              const SizedBox(height: 32),

              Text('مدیریت اقساط',style: textTheme.headline5!.apply(color: AppColors.primaryColor)),
              const SizedBox(height: 4),
              Text(AppStrings.installmentHelpTxt,style: textTheme.subtitle1,textAlign: TextAlign.justify),


            ],
          ),
        ),
      ),
    );
  }
}
