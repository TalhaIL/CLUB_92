import 'dart:developer';

import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/top_speaker.dart';
import 'package:club_92/screens/interests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakersScreen extends StatelessWidget {
  final SpeakerController _speakerController = Get.put(SpeakerController());

  SpeakersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        centerTitle: true,
        title: const Text(
          'TOP SPEAKERS',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomMaterialButton(
          onPress: () {
            Get.to(() => InterestScreen());
          },
          text: 'Next',
          width: 130,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisExtent: 95,
                mainAxisSpacing: 20.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _speakerController
                              .listOfSpeakers[index].isSelected!.value =
                          !_speakerController
                              .listOfSpeakers[index].isSelected!.value;

                      log(_speakerController.listOfSpeakers[index].isSelected
                          .toString());
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    _speakerController
                                        .listOfSpeakers[index].profileImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: _speakerController
                                    .listOfSpeakers[index].isSelected!.value,
                                child: Positioned(
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: greenColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          _speakerController.listOfSpeakers[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: _speakerController.listOfSpeakers.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
