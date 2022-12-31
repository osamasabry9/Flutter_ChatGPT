import 'package:flutter/material.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !_isComplete) {
          _isComplete = true;
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: Transform.rotate(
              angle: _animation.value * 2 * 3.14,
              child: Image.asset(
                ImageAssets.openAiAvatar,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
