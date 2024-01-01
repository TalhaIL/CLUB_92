import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/interests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakersList extends StatelessWidget {
  const SpeakersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        backgroundColor: appColor,
        centerTitle: true,
        title: const Text(
          'TOP SPEAKERS',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: CustomMaterialButton(
          onPress: () {
            Get.to(() => InterestScreen());
          },
          text: 'Next',
          width: 120,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: CustomScrollView(
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
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
