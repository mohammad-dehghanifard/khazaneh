import 'package:flutter/material.dart';
import 'package:khazaneh/core/constant/style/text_style.dart';

class CalculatorBtn extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onTap;

  const CalculatorBtn({required this.bgColor,required this.text,required this.textColor,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: bgColor
        ),
        child: Center(
          child: Text(text,style: AppTextStyle.calculateBtnTxtStyle.apply(color: textColor)),
        ),
      ),
    );
  }
}
