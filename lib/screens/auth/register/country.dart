import 'package:club_92/core/components/reusableWidgets/app_logo.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/screens/auth/register/otp.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ChooseCountryScreen extends StatefulWidget {
  static const String route = '/choose-country-screen';
  const ChooseCountryScreen({super.key});

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: textFieldColor,
                border: Border.all(
                  color: Colors.blueGrey.withOpacity(
                    0.2,
                  ),
                  width: 1.0,
                ),
              ),
              child: CountryCodePicker(
                showDropDownButton: true,
                onChanged: print,
                initialSelection: 'Pk',
                showFlag: true,
                showFlagMain: false,
                showFlagDialog: true,
                showOnlyCountryWhenClosed: true,
                alignLeft: true,
                padding: const EdgeInsets.all(0),
                dialogBackgroundColor: Theme.of(context).colorScheme.surface,
                searchDecoration: InputDecoration(
                  hintText: 'Choose Country',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: appColor,
                    ),
                  ),
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
                Get.toNamed(OtpScreen.route);
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ).animate().fade().scaleX(delay: 100.ms)
          ],
        ),
      ),
    );
  }
}
