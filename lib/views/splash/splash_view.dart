import 'package:deltech_challenge/controllers/splash/splash_controller.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/disappearing_pokeball.dart';
import 'package:deltech_challenge/widgets/pulsating_pokeball.dart';
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

  @override
  void initState() {
    super.initState();
    controller.verifyAuthentication();
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
              ? DisappearingPokeball()
              : PulsatingPokeball();
        }),
      ),
    );
  }
}
