import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  final List<String> names = [
    'Aliiiiiiiii',
    'Aliiiiiiiiiiiiiiiiiiiiiiii',
    'Ali',
    'Ali',
    'Ali',
    'Ali',
    'Ali',
    'Ali',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: CustomMaterialButton(
          onPress: () {
            Get.to(
              () => const HomeScreen(),
            );
          },
          text: 'Next',
          width: 120,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: const Text(
              'INTERESTS',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            expandedHeight: 150.0,
            floating: false,
            backgroundColor: appColor,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Center(
                  child: Text(
                    'Add more interests so we can provide best related rooms for you',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'TECHNOLOGY',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 350,
                          child: Wrap(
                            spacing: 10,
                            children: names
                                .map(
                                  (e) => ChoiceChip(
                                    selected: true,
                                    label: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 4,
            ),
          )
        ],
      ),
    );
  }
}
