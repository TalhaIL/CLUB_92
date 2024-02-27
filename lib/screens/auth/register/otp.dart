import 'package:club_92/components/reusableWidgets/app_logo.dart';
import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/components/reusableWidgets/logo_with_text.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/auth/register/username.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VERIFICATION',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: const [
                    TextSpan(text: 'Enter verification code sent\n'),
                    TextSpan(text: 'on your given number.'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomTextField(hintText: 'Enter code here'),
              const SizedBox(
                height: 30,
              ),
              CustomMaterialButton(
                onPress: () {
                  Get.to(
                    () => const UserName(),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Didn't recieve it?",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "RESEND",
                style: TextStyle(color: appColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
