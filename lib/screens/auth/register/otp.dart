import 'package:club_92/core/components/reusableWidgets/app_logo.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/screens/auth/register/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  static const String route = '/otp-screen';
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
                height: 20,
              ),
              const CustomTextField(hintText: 'Enter code here'),
              const SizedBox(
                height: 10,
              ),
              CustomMaterialButton(
                onPress: () {
                  Get.toNamed(
                    AddUserDetailsScreen.route,
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ).animate().fade().scaleX(delay: 100.ms),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Didn't recieve it?",
              ),
              const SizedBox(
                height: 10,
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
