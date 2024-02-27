import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/components/reusableWidgets/logo_with_text.dart';
import 'package:club_92/screens/auth/login/forgot_password_screen.dart';
import 'package:club_92/screens/auth/register/country.dart';
import 'package:club_92/screens/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
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
            const LogowithText(),
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
                  Get.to(
                    () => const ForgotPassword(),
                  );
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
              height: 20,
            ),
            CustomMaterialButton(
              onPress: () {
                Get.offAll(
                  () => const HomeScreen(),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: RichText(
                text: TextSpan(
                  text: "Don't have account ? ",
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(color: Colors.blue, fontSize: 17),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(
                            () => const ChooseCountry(),
                          );
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
