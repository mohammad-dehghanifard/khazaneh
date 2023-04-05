import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:khazaneh/core/constant/style/text_style.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CalculatorBtn extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final Color bgColor;
  final VoidCallback onTap;

  const CalculatorBtn({required this.bgColor,required this.text,required this.textColor,required this.onTap,Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              inset: true
            )
          ],
          color: bgColor
        ),
        child: Center(
          child: Text(text,style: AppTextStyle.calculateBtnTxtStyle.copyWith(color: textColor,fontSize: fontSize )),
        ),
      ),
    );
  }
}
