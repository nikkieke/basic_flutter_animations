import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsSimulationSample extends StatefulWidget {
  const PhysicsSimulationSample({super.key});

  @override
  State<PhysicsSimulationSample> createState() =>
      _PhysicsSimulationSampleState();
}

class _PhysicsSimulationSampleState extends State<PhysicsSimulationSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //define range/limits of the animation value
      lowerBound: 0,
      upperBound: double.infinity,
      duration: const Duration(seconds: 2),
    );

    _simulation = SpringSimulation(
        const SpringDescription(mass: 0.5, stiffness: 100, damping: 10),
        0, //initial position
        200, // target position
        0 //target velocity
        );

    _controller.animateWith(_simulation);
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
        title: const Text('Physics simulation sample'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
                MediaQuery.of(context).size.width / 2.5, _controller.value),
            child: child,
          );
        },
        child: GestureDetector(
          onTap: () {
            _controller.animateWith(_simulation);
          },
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
            child: const Center(
              child: Text(
                'Bouncy!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
