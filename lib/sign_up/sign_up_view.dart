import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/sign_up/controller/sign_up_controller.dart';
import 'package:deltech_challenge/theme/colors.dart';
import 'package:deltech_challenge/utils/snack_bar.dart';
import 'package:deltech_challenge/widgets/custom_button.dart';
import 'package:deltech_challenge/widgets/custom_text_field.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    SignUpController controller = SignUpController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        minimum: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Crie sua conta',
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                  Expanded(
                      child: CustomTextField(
                    title: 'Nome',
                    controller: controller.nameController,
                    isPassword: false,
                  )),
                  Expanded(
                      child: CustomTextField(
                    title: 'E-mail',
                    controller: controller.emailController,
                    isPassword: false,
                  )),
                  Expanded(
                      child: CustomTextField(
                    title: 'Senha',
                    controller: controller.passwordController,
                    isPassword: true,
                  )),
                  Expanded(
                      child: CustomTextField(
                    title: 'Confirme a senha',
                    controller: controller.confirmPasswordController,
                    isPassword: true,
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Observer(builder: (_) {
                          return controller.isLoading
                              ? LoadingPokeball()
                              : CustomButton(
                                  text: 'Cadastrar',
                                  function: controller.register,
                                  textColor: AppColors.mainColor,
                                  buttonColor: Colors.white,
                                );
                        })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Já possui uma conta?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        text: 'Login',
                        function: null,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                if (controller.exceptionMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showSnackBar(context, controller.exceptionMessage!);
                    controller.exceptionMessage = null;
                  });
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
