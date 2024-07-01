import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen1 extends StatefulWidget {
  const AnimationScreen1({super.key});

  @override
  State<AnimationScreen1> createState() => _AnimationScreen1State();
}

class _AnimationScreen1State extends State<AnimationScreen1> with TickerProviderStateMixin {
  late final AnimationController _controllerCheckOn;
  late final AnimationController _controllerCheckOff;
  late final AnimationController _controllerPostmenuOn;
  late final AnimationController _controllerPostmenuOff;

  bool isCheckOnTapped = true;
  bool isCheckOffTapped = true;
  bool isPostmenuOnTapped = true;
  bool isPostmenuOffTapped = true;

  @override
  void initState() {
    super.initState();
    _controllerCheckOn = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _controllerCheckOff = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _controllerPostmenuOn = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _controllerPostmenuOff = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controllerCheckOn.dispose();
    _controllerCheckOff.dispose();
    _controllerPostmenuOn.dispose();
    _controllerPostmenuOff.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 1'),
      ),
      body: ListView(
        children: [
          Lottie.asset('assets/check.json'),
          InkWell(
            enableFeedback: false,
            onTap: () async {
              print('tap');
              if (isCheckOnTapped) {
                await _controllerCheckOn.forward();
              } else {
                await _controllerCheckOn.reverse();
              }
              setState(() {
                isCheckOnTapped = !isCheckOnTapped;
              });
            },
            child: Lottie.asset(
              'assets/check_on.json',
              controller: _controllerCheckOn,
            ),
          ),
          InkWell(
            enableFeedback: false,
            onTap: () async {
              print('tap');
              if (isCheckOffTapped) {
                await _controllerCheckOff.forward();
              } else {
                await _controllerCheckOff.reverse();
              }
              setState(() {
                isCheckOffTapped = !isCheckOffTapped;
              });
            },
            child: Lottie.asset(
              'assets/check_off.json',
              controller: _controllerCheckOff,
            ),
          ),
          Container(
            color: Colors.blue,
            child: InkWell(
              enableFeedback: false,
              onTap: () async {
                print('tap');
                if (isPostmenuOnTapped) {
                  await _controllerPostmenuOn.forward();
                } else {
                  await _controllerPostmenuOn.reverse();
                }
                setState(() {
                  isPostmenuOnTapped = !isPostmenuOnTapped;
                });
              },
              child: Lottie.asset(
                'assets/postmenu_on.json',
                controller: _controllerPostmenuOn,
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: InkWell(
              enableFeedback: false,
              onTap: () async {
                print('tap');
                if (isPostmenuOffTapped) {
                  await _controllerPostmenuOff.forward();
                } else {
                  await _controllerPostmenuOff.reverse();
                }
                setState(() {
                  isPostmenuOffTapped = !isPostmenuOffTapped;
                });
              },
              child: Lottie.asset(
                'assets/postmenu_off.json',
                controller: _controllerPostmenuOff,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
