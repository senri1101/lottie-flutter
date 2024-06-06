import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen4 extends StatelessWidget {
  const AnimationScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 4'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Lottie.asset(
            'assets/LottieLogo1.json',
            animate: true,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
