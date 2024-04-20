import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/core/constants/speaker.dart';
import 'package:club_92/models/speaker_modal.dart';
import 'package:club_92/screens/auth/register/interests.dart';
import 'package:club_92/core/utils/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ChooseSpeakersScreen extends StatefulWidget {
  static const String route = 'choose-speakers-screen';
  const ChooseSpeakersScreen({super.key});

  @override
  State<ChooseSpeakersScreen> createState() => _ChooseSpeakersScreenState();
}

class _ChooseSpeakersScreenState extends State<ChooseSpeakersScreen> {
  List<Speaker> selectedSpeakers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TOP SPEAKERS',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: selectedSpeakers.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomMaterialButton(
                onPress: () {
                  Get.toNamed(UsersInterestScreen.route);
                },
                width: 130,
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ).animate().fade().scaleX(delay: 100.ms),
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
                mainAxisExtent: 100,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      listOfSpeakers[index].isSelected.value =
                          !listOfSpeakers[index].isSelected.value;
                      setState(() {
                        selectedSpeakers.contains(listOfSpeakers[index])
                            ? selectedSpeakers.remove(listOfSpeakers[index])
                            : selectedSpeakers.add(listOfSpeakers[index]);
                      });
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            MyCachedNetworkImage(
                              profileImage: listOfSpeakers[index].profileImage,
                              height: 70,
                              width: 70,
                              borderRadius: 20,
                            ),
                            Obx(
                              () => Visibility(
                                visible: listOfSpeakers[index].isSelected.value,
                                child: Positioned(
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: appColor,
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
                          listOfSpeakers[index].name,
                        )
                      ],
                    ),
                  );
                },
                childCount: listOfSpeakers.length,
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
