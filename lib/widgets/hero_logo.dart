import 'package:deltech_challenge/constants/images.dart';
import 'package:flutter/material.dart';

class HeroLogo extends StatelessWidget {
  const HeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image.asset(
        AppImages.logo,
      ),
    );
  }
}
