import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/utils/instruction_dialog.dart';
import 'package:club_92/constants/speaker.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        title: const Text('Activity'),
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
