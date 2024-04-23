import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/controllers/interest/interest_controller.dart';
import 'package:club_92/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class UsersInterestScreen extends StatelessWidget {
  static const String route = 'users-interest-screen';
  final InterestController _interestController = Get.put(InterestController());
  final bool isFromSettings;
  UsersInterestScreen({super.key, required this.isFromSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomMaterialButton(
          onPress: () {
            Get.offAndToNamed(HomeScreen.route);
          },
          child: Text(
            isFromSettings ? 'Save' : 'Next',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ).animate().fade().scaleX(delay: 100.ms),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            title: const Text(
              'INTERESTS',
              style: TextStyle(fontSize: 15),
            ),
            expandedHeight: 120.0,
            centerTitle: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Container(
                margin: const EdgeInsets.only(top: 70),
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
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
                                        side: BorderSide(
                                          color: appColor,
                                        ),
                                        label: Text(
                                          v.categoryName,
                                          style: TextStyle(
                                            color: v.isSelected.value
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: v.isSelected.value
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .background,
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
