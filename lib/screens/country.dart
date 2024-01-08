import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseCountry extends StatelessWidget {
  const ChooseCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hintText: 'Choose country',
              isEnabled: false,
              isReadOnly: true,
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
              hintText: 'Enter phone number',
            ),
            const SizedBox(
              height: 40,
            ),
            CustomMaterialButton(
              onPress: () {
                Get.to(() => const OtpScreen());
              },
              text: 'NEXT',
            )
          ],
        ),
      ),
    );
  }
}
