import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen1 extends StatefulWidget {
  const AnimationScreen1({super.key});

  @override
  State<AnimationScreen1> createState() => _AnimationScreen1State();
}

class _AnimationScreen1State extends State<AnimationScreen1> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 1'),
      ),
      floatingActionButton: InkWell(
        enableFeedback: false,
        onTap: () async {
          if (isTapped) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: Lottie.asset(
          'assets/chack_on.json',
          controller: _controller,
        ),
      ),
      body: ListView(
        children: [
          Lottie.asset('assets/check.json'),
        ],
      ),
    );
  }
}
