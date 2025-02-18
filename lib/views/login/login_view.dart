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
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroLogo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Welcome to your Pokedex!',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              Column(children: [
                CustomTextField(
                  title: 'E-mail',
                  controller: controller.emailController,
                ),
                Observer(builder: (context) {
                  return CustomTextField(
                    title: 'Password',
                    controller: controller.passwordController,
                    isPassword: true,
                    onSubmitted: (_) => controller.login(),
                    isObscure: controller.passwordObscure,
                    switchVisibility: () =>
                        controller.switchPasswordVisibility(),
                  );
                }),
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
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      text: 'Sign Up',
                      function: () => controller.navigateToSignUpPage(context),
                    )),
                  ],
                ),
              ])
            ],
          ),
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
      ),
    ));
  }
}
