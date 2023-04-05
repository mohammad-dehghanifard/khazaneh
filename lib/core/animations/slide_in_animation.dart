import 'package:flutter/cupertino.dart';

class SlideInAnimation extends StatefulWidget{
  final Widget child;
  final AxisDirection animDirection;
  final Duration animDuration;
  const SlideInAnimation({required this.animDirection,required this.animDuration,required this.child,super.key});

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> transactionAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: widget.animDuration);
    final startPosition = widget.animDirection == AxisDirection.left ? 1.0 : -1.0 ;
    transactionAnimation = Tween<Offset>(
      begin: Offset(startPosition,0),
      end: const Offset(0,0),
    ).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: transactionAnimation,child: widget.child);
  }
}