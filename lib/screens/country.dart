import 'dart:developer';

import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/components/reusableWidgets/language_bottom_sheet.dart';
import 'package:club_92/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({super.key});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 5), () {
    //   showModalBottomSheet(
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       ),
    //     ),
    //     backgroundColor: Colors.black,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const LanguageBottomSheet();
    //     },
    //   );
    // });

    super.initState();
  }

  bool isFirstBuild = true;
  @override
  Widget build(BuildContext context) {
    if (isFirstBuild) {
      Future.delayed(Duration.zero, () {
        showModalBottomSheet(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.black,
          context: context,
          builder: (BuildContext context) {
            return const LanguageBottomSheet();
          },
        );
        setState(() {
          isFirstBuild = false;
        });
      });
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                log('Country');
              },
              child: CustomTextField(
                hintText: 'Choose country',
                isEnabled: false,
                isReadOnly: true,
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down),
                  color: Colors.white,
                ),
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
