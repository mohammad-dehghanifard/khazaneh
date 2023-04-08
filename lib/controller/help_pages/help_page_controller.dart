import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khazaneh/core/constant/strings/app_strings.dart';
import 'package:khazaneh/gen/assets.gen.dart';
import 'package:khazaneh/view/details/help_screen/help_page.dart';

class HelpPageController extends GetxController{
  // screen list
  final List<HelpPage> pages = [
    HelpPage(imagePath: Assets.icons.creditCard.path, title: 'افزودن تراکنش جدید', content: AppStrings.addTransactionHelpTxt),
    HelpPage(imagePath: Assets.icons.wallet.path, title: 'لیست تراکنش ها', content: AppStrings.transactionListHelpTxt),
    HelpPage(imagePath: Assets.icons.financeGrowth.path, title: 'آمار تراکنش ها', content: AppStrings.transactionInformationHelpTxt),
    HelpPage(imagePath: Assets.icons.money.path, title: 'سایر خدمات', content: AppStrings.moreAppServiceHelpTxt),
  ];
  // page controller
  final PageController pageController = PageController();

}