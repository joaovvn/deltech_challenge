import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:flutter/material.dart';

class PulsatingPokeball extends StatefulWidget {
  const PulsatingPokeball({super.key});

  @override
  State<PulsatingPokeball> createState() => _PulsatingPokeballState();
}

class _PulsatingPokeballState extends State<PulsatingPokeball>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 950),
      vsync: this,
      upperBound: 0.85,
      lowerBound: 0.5,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 0.85).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: Image.asset(AppImages.pokeball),
        ),
        SizedBox(height: 100, child: HeroLogo())
      ],
    );
  }
}
