import 'package:deltech_challenge/controllers/login/login_controller.dart';
import 'package:deltech_challenge/theme/colors.dart';
import 'package:deltech_challenge/utils/snack_bar.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/custom_button.dart';
import 'package:deltech_challenge/widgets/custom_text_field.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController();
    return BaseScaffold(
        body: Column(
      children: [
        Spacer(),
        HeroLogo(),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bem vindo à sua Pokedex!',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Spacer(),
              CustomTextField(
                title: 'E-mail',
                controller: controller.emailController,
              ),
              CustomTextField(
                title: 'Senha',
                controller: controller.passwordController,
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
                              text: 'Login',
                              function: controller.login,
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
                  'Ainda não possui uma conta?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: 'Cadastrar-se',
                    function: () => controller.navigateToSignUpPage(context),
                  )),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Observer(
          builder: (_) {
            if (controller.loggedIn) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.navigateToHomePage(context);
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
    ));
  }
}
