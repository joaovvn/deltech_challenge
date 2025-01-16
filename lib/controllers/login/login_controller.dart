import 'package:deltech_challenge/core/auth_error_handler.dart';
import 'package:deltech_challenge/views/home/home_view.dart';
import 'package:deltech_challenge/views/sign_up/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final FirebaseAuth auth = GetIt.instance<FirebaseAuth>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  String? message;

  @observable
  bool loggedIn = false;

  @observable
  bool passwordObscure = true;

  @action
  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      message = 'Fill all the fields!';
      isLoading = false;
      return;
    }

    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (!credential.user!.emailVerified) {
        message = 'Verify your e-mail to login!';
        await auth.signOut();
      }
      if (auth.currentUser != null) {
        loggedIn = true;
      }
    } on FirebaseAuthException catch (exception) {
      message = handleAuthError(exception);
    }
    isLoading = false;
  }

  @action
  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => SignUpView()));
  }

  @action
  void switchPasswordVisibility() {
    passwordObscure = !passwordObscure;
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
  }
}
