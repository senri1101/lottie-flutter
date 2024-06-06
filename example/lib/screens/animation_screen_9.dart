import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen9 extends StatelessWidget {
  const AnimationScreen9({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 9'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'powered by ほぼ日手帳',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2024年 2月',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    final day = index + 1;
                    final dayOfWeek = DateTime(2024, 2, day).weekday;
                    final dayOfWeekText = ['月', '火', '水', '木', '金', '土', '日'][dayOfWeek - 1];
                    return index % 5 != 0
                        ? Container(
                            color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            child: Row(
                              children: [
                                Text(
                                  '$day',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  dayOfWeekText,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        : const AnimatedDogCharacter(assetPath: 'assets/fly.json');
                  },
                ),
              ),
            ],
          ),
          const Positioned(
              bottom: 0,
              left: 0,
              child: Column(
                children: [
                  AnimatedDogCharacter(assetPath: 'assets/cat.json'),
                  SizedBox(height: 16),
                ],
              )),
        ],
      ),
    );
  }
}

class AnimatedDogCharacter extends StatefulWidget {
  const AnimatedDogCharacter({super.key, required this.assetPath});
  final String assetPath;

  @override
// ignore: library_private_types_in_public_api
  _AnimatedDogCharacterState createState() => _AnimatedDogCharacterState();
}

class _AnimatedDogCharacterState extends State<AnimatedDogCharacter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.8),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: _handleTap,
        child: SlideTransition(
          position: _slideAnimation,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Lottie.asset(widget.assetPath),
              ),
              const CharacterWithSpeechBubble(),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterWithSpeechBubble extends StatelessWidget {
  const CharacterWithSpeechBubble({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'いい天気だねーー',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
