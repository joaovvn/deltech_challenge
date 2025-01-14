import 'package:deltech_challenge/controllers/sign_up/sign_up_controller.dart';
import 'package:deltech_challenge/theme/colors.dart';
import 'package:deltech_challenge/utils/snack_bar.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/custom_button.dart';
import 'package:deltech_challenge/widgets/custom_text_field.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = SignUpController();
    return BaseScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          HeroLogo(),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crie sua conta',
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
                CustomTextField(
                  title: 'Nome',
                  controller: controller.nameController,
                  isPassword: false,
                ),
                CustomTextField(
                  title: 'E-mail',
                  controller: controller.emailController,
                  isPassword: false,
                ),
                CustomTextField(
                  title: 'Senha',
                  controller: controller.passwordController,
                  isPassword: true,
                ),
                CustomTextField(
                  title: 'Confirme a senha',
                  controller: controller.confirmPasswordController,
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Observer(builder: (_) {
                        return controller.isLoading
                            ? LoadingPokeball()
                            : CustomButton(
                                text: 'Cadastrar',
                                function: controller.signUp,
                                textColor: AppColors.mainColor,
                                buttonColor: Colors.white,
                              );
                      })),
                    ],
                  ),
                ),
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
                      function: () => controller.navigateToLoginPage(context),
                    )),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Observer(
            builder: (_) {
              if (controller.signUpCompleted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.navigateToLoginPage(context);
                });
              }
              if (controller.message != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showSnackBar(context, controller.message!);
                  controller.message = null;
                });
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
