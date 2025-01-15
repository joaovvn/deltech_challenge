import 'package:deltech_challenge/core/auth_error_handler.dart';
import 'package:deltech_challenge/views/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  final FirebaseAuth auth = GetIt.instance<FirebaseAuth>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  String? message;

  @observable
  bool signUpCompleted = false;

  @action
  Future<void> signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      message = 'Fill all the fields!';
      isLoading = false;
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      message = 'Passwords not matching!';
      isLoading = false;
      return;
    }

    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await credential.user?.updateDisplayName(nameController.text);
      await credential.user?.sendEmailVerification();
      message = 'Verification e-mail sent!';
      signUpCompleted = true;
      return;
    } on FirebaseAuthException catch (exception) {
      message = handleAuthError(exception);
    }
    isLoading = false;
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
  }
}
