import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/interest_controller.dart';
import 'package:club_92/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestScreen extends StatelessWidget {
  final InterestController _interestController = Get.put(InterestController());

  InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomMaterialButton(
          onPress: () {
            Get.offAll(() => const HomeScreen());
          },
          text: 'Next',
          width: 130,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            title: const Text(
              'INTERESTS',
              style: TextStyle(fontSize: 17),
            ),
            expandedHeight: 150.0,
            floating: true,
            backgroundColor: appColor,
            // pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Center(
                  child: Text(
                    'Add more interests so we can provide best related rooms for you',
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
                      Text(
                        _interestController.interests[index].name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 400,
                          child: Wrap(
                            spacing: 10,
                            children: _interestController
                                .interests[index].subCategories
                                .map(
                                  (v) => GestureDetector(
                                    onTap: () {
                                      v.isSelected.value = !v.isSelected.value;
                                    },
                                    child: Obx(
                                      () => Chip(
                                        side: const BorderSide(
                                          color: Colors.green,
                                        ),
                                        label: Text(
                                          v.categoryName,
                                          style: TextStyle(
                                            color: v.isSelected.value
                                                ? Colors.white
                                                : greenColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: v.isSelected.value
                                            ? Colors.green
                                            : appColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: _interestController.interests.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80.0, // Specify the height of the SizedBox
            ),
          ),
        ],
      ),
    );
  }
}
