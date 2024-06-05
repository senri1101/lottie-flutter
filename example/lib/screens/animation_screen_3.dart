import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen3 extends StatefulWidget {
  const AnimationScreen3({super.key});

  @override
  _AnimationScreen3State createState() => _AnimationScreen3State();
}

class _AnimationScreen3State extends State<AnimationScreen3> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) => _showLoader());
  }

  void _showLoader() {
    showDialog<void>(
      context: context,
      builder: (context) => Center(
        child: Lottie.network(
          'https://assets10.lottiefiles.com/datafiles/QeC7XD39x4C1CIj/data.json',
          fit: BoxFit.contain,
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 3'),
      ),
      body: const Center(),
    );
  }
}
