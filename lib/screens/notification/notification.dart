import 'dart:developer';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/controllers/notification/notification_controller.dart';
import 'package:club_92/core/utils/instruction_dialog.dart';
import 'package:club_92/core/constants/speaker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  static const String route = '/notification-screen';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = Get.put(NotificationController());

  void _checkInstructionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shown = prefs.getBool('isActivityInstructionShown') ?? false;
    if (!shown) {
      if (mounted) {
        instructionDialog(
            context: context,
            title: 'Instruction',
            content: 'Swipe to delete activity');
      }
      prefs.setBool('isActivityInstructionShown', true);
    }
  }

  @override
  void initState() {
    _checkInstructionStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Activity'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.tune),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Theme.of(context).colorScheme.surface,
            elevation: 0,
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Related to your'),
              ),
              PopupMenuItem(
                onTap: () {
                  notificationController.notifyYourEvents.value =
                      !notificationController.notifyYourEvents.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Events'),
                    Obx(
                      () => Switch(
                          value: notificationController.notifyYourEvents.value,
                          onChanged: (v) {
                            notificationController.notifyYourEvents.value = v;
                          }),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  notificationController.notifyFollowingEvents.value =
                      !notificationController.notifyFollowingEvents.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Following Events'),
                    Obx(
                      () => Switch(
                          value: notificationController
                              .notifyFollowingEvents.value,
                          onChanged: (v) {
                            log(v.toString());
                            setState(() {
                              notificationController
                                  .notifyFollowingEvents.value = v;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  notificationController.notifyOthers.value =
                      !notificationController.notifyOthers.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Others'),
                    Obx(
                      () => Switch(
                        value: notificationController.notifyOthers.value,
                        onChanged: (v) {
                          notificationController.notifyOthers.value = v;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMaterialButton(
                    height: 30,
                    width: 70,
                    onPress: () {
                      Get.back();
                    },
                    child: Text(
                      'Filter',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: Key(
              index.toString(),
            ),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {},
            child: CustomSpeakerTile(
              profileImage: listOfSpeakers[index].profileImage,
              name: listOfSpeakers[index].name,
              index: index,
            ),
          ),
          itemCount: listOfSpeakers.length,
        ),
      ),
    );
  }
}
