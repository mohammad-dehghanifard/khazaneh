import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khazaneh/controller/help_pages/help_page_controller.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';


class HelpScreen extends StatelessWidget {
   HelpScreen({Key? key}) : super(key: key);
   final HelpPageController controller = Get.put(HelpPageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar(pageTitle: 'راهنمای استفاده از نرم افزار'),
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                children: controller.pages,
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               // back btn
               ElevatedButton(
                   onPressed: () {
                     controller.pageController.animateToPage(controller.pageController.page!.round() - 1, duration: const Duration(milliseconds: 300),  curve: Curves.easeIn);
                   },
                   style: const ButtonStyle(
                     minimumSize: MaterialStatePropertyAll(Size(64,48))
                   ),
                   child: const Icon(Icons.arrow_back)),
               // go to next page btn
               ElevatedButton(
                   onPressed: () {
                     controller.pageController.animateToPage(controller.pageController.page!.round() + 1, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                   },
                   style: const ButtonStyle(
                     minimumSize: MaterialStatePropertyAll(Size(64,48))
                   ),
                   child: const Icon(Icons.arrow_forward)),
             ],
           )
          ],
        )
      ),
    );
  }
}
