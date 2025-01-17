import 'package:deltech_challenge/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.resizeToAvoidBottomInset = true,
      this.backgroundColor = AppColors.mainColor});

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: body,
      ),
    );
  }
}
