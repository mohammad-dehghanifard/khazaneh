import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  final Duration duration;
  final double startValue;
  final double endValue;
  final Widget child;


  const OpacityAnimation(
      {required this.duration,
      required this.startValue,
      required this.endValue,
      required this.child,
      Key? key})
      : super(key: key);

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> with SingleTickerProviderStateMixin {
   late AnimationController animationController;
   late Animation<double> animation;

   @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: widget.duration);
    animation = Tween<double>(begin: widget.startValue,end: widget.endValue).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    return animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
      return AnimatedOpacity(duration: widget.duration,opacity: animation.value,child: widget.child);
    },);
  }
}
