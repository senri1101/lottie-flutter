import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/lottie_animation_widget.dart';

class AnimationScreen8 extends StatefulWidget {
  const AnimationScreen8({super.key});

  @override
  _AnimationScreen8State createState() => _AnimationScreen8State();
}

class _AnimationScreen8State extends State<AnimationScreen8> {
  final ScrollController _scrollController = ScrollController();
  final itemCount = 100;
  final Random _random = Random();

  List<Map<String, dynamic>> _generateAnimationConfigs(int count) {
    return List.generate(count, (index) {
      final width = (50 + _random.nextInt(300)).toDouble();
      final height = (50 + _random.nextInt(500)).toDouble();
      final beginX = _random.nextDouble() * 2 - 1;
      final beginY = _random.nextDouble() * 2 - 1;
      final endX = _random.nextDouble() * 2 - 1;
      final endY = _random.nextDouble() * 2 - 1;
      final durationInSeconds = 5 + _random.nextInt(20);

      return {
        'width': width,
        'height': height,
        'begin': Offset(beginX, beginY),
        'end': Offset(endX, endY),
        'duration': Duration(seconds: durationInSeconds),
      };
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 100,
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationConfigs = _generateAnimationConfigs(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 8'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.grey[200] : null,
                child: ListTile(
                  title: Text('Item ${index + 1}'),
                ),
              );
            },
          ),
          ...animationConfigs.map((config) {
            return Positioned(
              left: _random.nextDouble() * MediaQuery.of(context).size.width,
              top: _random.nextDouble() * MediaQuery.of(context).size.height,
              child: LottieAnimationWidget(
                assetName: 'assets/fly.json',
                width: config['width'] as double,
                height: config['height'] as double,
                begin: config['begin'] as Offset,
                end: config['end'] as Offset,
                duration: config['duration'] as Duration,
              ),
            );
          }),
        ],
      ),
    );
  }
}
