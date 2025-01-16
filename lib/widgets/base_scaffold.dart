import 'package:deltech_challenge/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.backgroundColor = AppColors.mainColor});

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: body,
      ),
    );
  }
}
