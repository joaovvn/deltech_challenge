import 'package:deltech_challenge/core/injector.dart';
import 'package:deltech_challenge/sign_up/sign_up_view.dart';
import 'package:deltech_challenge/theme/colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
          fontFamily: 'Kodchasan',
          useMaterial3: true,
        ),
        home: const RegisterView(),
      ),
    );
  }
}
