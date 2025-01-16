import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/controllers/splash/splash_controller.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  SplashController controller = SplashController();
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller.verifyAuthentication();
    _controller = AnimationController(
      duration: Duration(milliseconds: 950),
      vsync: this,
      upperBound: 0.85,
      lowerBound: 0.5,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.5, end: 0.85).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Observer(builder: (context) {
          if (controller.authenticated != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.authenticated!
                  ? controller.navigateToHomePage(context)
                  : controller.navigateToLoginPage(context);
            });
          }
          return controller.loaded
              ? Column(
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
                )
              : Column(
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
        }),
      ),
    );
  }
}
