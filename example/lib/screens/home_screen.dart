import 'package:flutter/material.dart';

import 'animation_screen_1.dart';
import 'animation_screen_2.dart';
import 'animation_screen_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnimationScreen1()),
                );
              },
              child: const Text('ボタンのアニメーション'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnimationScreen2()),
                );
              },
              child: const Text('スクロールのアニメーション・lottieを上から下へ移動させる'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnimationScreen3()),
                );
              },
              child: const Text('ダイアログのアニメーション・lottieを表示する'),
            ),
          ],
        ),
      ),
    );
  }
}
