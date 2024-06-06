import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen5 extends StatefulWidget {
  const AnimationScreen5({super.key});

  @override
  State<AnimationScreen5> createState() => _AnimationScreen5State();
}

class _AnimationScreen5State extends State<AnimationScreen5> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
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
        title: const Text('Animation 5'),
      ),
      body: ListView(
        children: [
          Lottie.asset(
            'assets/LottieLogo1.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
        ],
      ),
    );
  }
}
