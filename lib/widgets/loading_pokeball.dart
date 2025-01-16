import 'package:deltech_challenge/constants/images.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingPokeball extends StatefulWidget {
  const LoadingPokeball({super.key});

  @override
  State<LoadingPokeball> createState() => _LoadingPokeballState();
}

class _LoadingPokeballState extends State<LoadingPokeball>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Durations.extralong2)
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, widget) {
        return Transform.rotate(
          angle: _animationController.value * 2 * math.pi,
          child: widget,
        );
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(
          AppImages.pokeball,
        ),
      ),
    );
  }
}
