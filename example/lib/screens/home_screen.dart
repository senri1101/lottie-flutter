import 'package:flutter/material.dart';

import 'animation_screen_1.dart';
import 'animation_screen_2.dart';
import 'animation_screen_3.dart';
import 'animation_screen_4.dart';
import 'animation_screen_5.dart';
import 'animation_screen_6.dart';
import 'animation_screen_7.dart';
import 'animation_screen_8.dart';
import 'animation_screen_9.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen1())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('1.ボタンのアニメーション'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen2())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('2.スクロールのアニメーションとlottieを上から下へ移動させる'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen3())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('3.ダイアログのアニメーション'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen4())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('4.アニメーションの繰り返し'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen5())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('5.アニメーションの制御'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen6())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('6.ボタンを押すとアニメーションが再生される'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen7())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('7.アニメーションの途中から再生するとか'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen8())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('8.スクロールのアニメーションとlottieにいろんな動きをさせる'),
                ),
              ),
              const SizedBox(height: 16), // ボタン間の余白を追加
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationScreen9())),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('9.左下にlottieを配置する、タップすると隠れる'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
