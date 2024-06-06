import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen12 extends StatefulWidget {
  const AnimationScreen12({super.key});

  @override
  State<AnimationScreen12> createState() => _AnimationScreen12State();
}

class _AnimationScreen12State extends State<AnimationScreen12> with TickerProviderStateMixin {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(text: /*'🔥Fire🔥'*/ 'Fire');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 12'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/Tests/DynamicText.json',
                delegates: LottieDelegates(
                  text: (animationText) => _textController.text,
                  textStyle: (font) => TextStyle(fontFamily: font.fontFamily, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: CupertinoTextField(
                controller: _textController,
                onChanged: (newText) {
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
