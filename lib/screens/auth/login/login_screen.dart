import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/screens/auth/login/forgot_password_screen.dart';
import 'package:club_92/screens/auth/register/country.dart';
import 'package:club_92/screens/home/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
              width: 170,
              child: Image(
                image: Theme.of(context).brightness == Brightness.light
                    ? const AssetImage('assets/images/light_logo.png')
                    : const AssetImage('assets/images/dark_logo.png'),
              ),
            ),
            const CustomTextField(hintText: 'Enter your email/username'),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(hintText: 'Enter your password'),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ForgotPasswordScreen.route);
                },
                child: const Text(
                  'Forget Password ?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomMaterialButton(
              onPress: () {
                Get.offAndToNamed(HomeScreen.route);
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ).animate().fade().slideY(delay: 500.ms),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: RichText(
                text: TextSpan(
                  text: "Don't have account ? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(color: Colors.blue, fontSize: 17),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(ChooseCountryScreen.route);
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
