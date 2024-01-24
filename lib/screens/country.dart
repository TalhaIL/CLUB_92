import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/components/reusableWidgets/language_bottom_sheet.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/otp.dart';
import 'package:country_code_picker/country_code_picker.dart';
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
                // countryFilter: const ['IT', 'FR'],
                // favorite: const ['+92', 'Pk', '+91', 'IN'],
                showFlag: true,
                showFlagMain: false,
                showFlagDialog: true,
                showOnlyCountryWhenClosed: false,
                alignLeft: true,

                padding: const EdgeInsets.all(0),
                dialogBackgroundColor: appColor.withOpacity(
                  1,
                ),
                searchDecoration: InputDecoration(
                  hintText: 'Choose Country',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greenColor,
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
