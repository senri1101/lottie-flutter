import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationWidget extends StatefulWidget {
  final String assetName;
  final double width;
  final double height;
  final Offset begin;
  final Offset end;
  final Duration duration;

  const LottieAnimationWidget({
    super.key,
    required this.assetName,
    required this.width,
    required this.height,
    required this.begin,
    required this.end,
    required this.duration,
  });

  @override
  _LottieAnimationWidgetState createState() => _LottieAnimationWidgetState();
}

class _LottieAnimationWidgetState extends State<LottieAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Lottie.asset(
        widget.assetName,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
