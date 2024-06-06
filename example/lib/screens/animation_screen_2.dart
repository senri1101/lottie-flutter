import 'package:flutter/material.dart';

import '../widgets/lottie_animation_widget.dart';

class AnimationScreen2 extends StatefulWidget {
  const AnimationScreen2({super.key});

  @override
  _AnimationScreen2State createState() => _AnimationScreen2State();
}

class _AnimationScreen2State extends State<AnimationScreen2> {
  final ScrollController _scrollController = ScrollController();
  final itemCount = 100;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 2'),
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
          const Positioned(
            top: 0,
            bottom: 0,
            right: 8,
            child: LottieAnimationWidget(
              assetName: 'assets/falling.json',
              width: 50,
              height: 50,
              begin: Offset(0.0, -0.9),
              end: Offset(0.0, 0.0),
              duration: Duration(seconds: 10),
            ),
          ),
        ],
      ),
    );
  }
}
