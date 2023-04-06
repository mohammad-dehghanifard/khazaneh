import 'package:flutter/material.dart';

class SlideInAnimation extends StatefulWidget {
  final Widget child; // شیء Widget که انیمیشن برای آن ایجاد می‌شود.
  final AxisDirection animDirection; // جهت حرکت انیمیشن.
  final Duration slideAnimDuration; // مدت زمان انیمیشن.
  final Duration opacityAnimDuration; // مدت زمان انیمیشن.

  const SlideInAnimation({
    required this.animDirection,
    required this.slideAnimDuration,
    required this.opacityAnimDuration,
    required this.child,
    super.key,
  });

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController; // کنترلر انیمیشن.
  late Animation<Offset> transactionAnimation; // انیمیشن حرکت.
  late Animation<double> opacityAnimation; // انیمیشن حرکت.

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: widget.slideAnimDuration); // تنظیم کردن کنترلر انیمیشن با مدت زمان داده شده.

    final startPosition = widget.animDirection == AxisDirection.left ? 1.0 : -1.0 ; // تعیین مکان شروع انیمیشن بر اساس جهت حرکت.

    transactionAnimation = Tween<Offset>(
      begin: Offset(startPosition,0),
      end: const Offset(0,0),
    ).animate(animationController); // ساخت انیمیشن

    opacityAnimation = Tween<double>(begin: 0,end: 1).animate(animationController);

    animationController.forward(); // اجرای انیمیشن.
  }

  @override
  void dispose() {
    animationController.dispose(); // توقف انیمیشن
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return AnimatedOpacity(
              opacity: opacityAnimation.value,
              duration: Duration(milliseconds: 600),
              child: SlideTransition(position: transactionAnimation, child: widget.child));
        },
    ); // اضافه کردن انیمیشن به Widget و بازگرداندن آن به عنوان خروجی.
  }
}
