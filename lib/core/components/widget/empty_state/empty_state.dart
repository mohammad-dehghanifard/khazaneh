import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:khazaneh/gen/assets.gen.dart';

class EmptyState extends StatelessWidget {
  final String content;
  final double imgSize;
  const EmptyState({required this.content,required this.imgSize,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(Assets.images.emptyState,height: imgSize),
          Text(content,style: AppTextStyle.regularTxtStyle)
        ],
      ),
    );
  }
}
