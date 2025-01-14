import 'package:deltech_challenge/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        minimum: EdgeInsets.all(24),
        child: body,
      ),
    );
  }
}
