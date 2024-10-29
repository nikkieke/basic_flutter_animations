import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimationSample extends StatefulWidget {
  const ImplicitAnimationSample({super.key});

  @override
  State<ImplicitAnimationSample> createState() =>
      _ImplicitAnimationSampleState();
}

class _ImplicitAnimationSampleState extends State<ImplicitAnimationSample> {
  bool _isBig = false;
  @override
  Widget build(BuildContext context) {
    var randWidth = Random().nextDouble() * 300;
    var randHeight = Random().nextDouble() * 300;

    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer Example')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isBig = !_isBig;
            });
          },
          child: AnimatedContainer(
            width: _isBig ? 200.0 : randWidth,
            height: _isBig ? 200.0 : randHeight,
            color: _isBig ? Colors.green : Colors.orange,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: const Center(
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
