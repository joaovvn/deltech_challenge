import 'package:deltech_challenge/views/home/home_view.dart';
import 'package:deltech_challenge/views/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final FirebaseAuth auth = GetIt.instance<FirebaseAuth>();

  @observable
  bool? authenticated;

  @observable
  bool loaded = false;

  @action
  verifyAuthentication() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      loaded = true;
      await Future.delayed(Duration(milliseconds: 900));
      auth.currentUser != null ? authenticated = true : authenticated = false;
    } catch (e) {
      rethrow;
    }
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
  }
}
