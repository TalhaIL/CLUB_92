import 'package:club_92/core/components/reusableWidgets/app_logo.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String route = '/forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const Text('We will send you a reset password link'),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(hintText: 'Enter your email'),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomMaterialButton(
              onPress: () {},
              child: const Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              ),
            ).animate().fade().scaleX(delay: 100.ms),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
