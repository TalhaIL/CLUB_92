import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/speaker.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => CustomSpeakerTile(
            profileImage: listOfSpeakers[index].profileImage,
            name: listOfSpeakers[index].name,
            index: index,
          ),
          itemCount: listOfSpeakers.length,
        ),
      ),
    );
  }
}
