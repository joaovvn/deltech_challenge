import 'package:deltech_challenge/constants/images.dart';
import 'package:flutter/material.dart';

class LoadingPikachu extends StatelessWidget {
  const LoadingPikachu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(
        AppImages.pikachu,
      ),
    );
  }
}
