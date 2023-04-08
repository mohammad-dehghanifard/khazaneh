import 'package:flutter/material.dart';
import 'package:khazaneh/core/animations/slide_in_animation.dart';
import 'package:khazaneh/core/components/appbars/secondary_appbar.dart';
import 'package:khazaneh/core/components/items/more_service_item.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';

class MainMoreService extends StatelessWidget {
  const MainMoreService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: secondaryAppBar(pageTitle: 'سایر خدمات'),
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1
          ),
          itemBuilder: (context, index) {
            return SlideInAnimation(
              animDirection: index % 2 == 0? AxisDirection.left : AxisDirection.right,
              slideAnimDuration: const Duration(milliseconds: 800),
              opacityAnimDuration: const Duration(milliseconds: 1000),
              child: MoreServiceItem(
                  size: size,
                  icon: Icons.calculate,
                  title: 'ماشین حساب',
                  onTap: () {},
              ),
            );
          },
      ),
    );
  }
}

