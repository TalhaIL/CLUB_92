import 'dart:developer';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  LanguageBottomSheetState createState() => LanguageBottomSheetState();
}

class LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.check),
        onPressed: () {
          log(selectedLanguage);
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'SELECT LANGUAGE',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    activeColor: Theme.of(context).colorScheme.primary,
                    title: Text(languages[index]),
                    value: languages[index],
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value.toString();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
