import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimationSample extends StatefulWidget {
  const ExplicitAnimationSample({super.key});

  @override
  State<ExplicitAnimationSample> createState() =>
      _ExplicitAnimationSampleState();
}

class _ExplicitAnimationSampleState extends State<ExplicitAnimationSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Define the animation (rotation from 0 to 2 * pi radians)
    _rotationAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_controller);

    // Start the animation and loop it infinitely
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation with Transform'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: child,
            );
          },
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
            ),
            child: const Center(
              child: Text(
                'Rotate Me!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
