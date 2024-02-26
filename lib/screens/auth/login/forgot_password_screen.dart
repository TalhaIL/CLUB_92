import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/components/reusableWidgets/logo_with_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            const LogowithText(),
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
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
