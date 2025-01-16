import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:flutter/material.dart';

class DisappearingPokeball extends StatelessWidget {
  const DisappearingPokeball({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.8, end: 0),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
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
