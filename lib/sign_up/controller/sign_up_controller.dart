import 'package:deltech_challenge/core/auth_error_handler.dart';
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
  String? exceptionMessage;

  @action
  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      exceptionMessage = 'Complete todos os campos!';
      isLoading = false;
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      exceptionMessage = 'As senhas são diferentes!';
      isLoading = false;
      return;
    }

    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      credential.user?.updateDisplayName(nameController.text);
    } on FirebaseAuthException catch (exception) {
      exceptionMessage = handleAuthError(exception);
    }
    isLoading = false;
  }
}
