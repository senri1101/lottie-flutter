import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen10 extends StatelessWidget {
  const AnimationScreen10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 10'),
      ),
      body: const Example(),
    );
  }
}

//---- example
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/cat.lottie',
      decoder: customDecoder,
    );
  }
}

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(bytes, filePicker: (files) {
    return files.firstWhereOrNull((f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
  });
}
//----
