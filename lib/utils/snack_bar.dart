import 'package:deltech_challenge/theme/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.white,
    duration: Durations.extralong4,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.mainColor,
          fontSize: 15,
          fontWeight: FontWeight.bold),
    ),
  ));
}
