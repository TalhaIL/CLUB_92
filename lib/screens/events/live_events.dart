import 'package:club_92/components/resuableMethods/custom_card.dart';
import 'package:club_92/constants/live_events.dart';
import 'package:club_92/screens/events/main_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveEvents extends StatelessWidget {
  const LiveEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 100, top: 15),
          physics: const BouncingScrollPhysics(),
          itemCount: liveEvents.length,
          itemBuilder: (context, index) {
            var event = liveEvents[index];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => MainEventScreen(
                    event: event,
                  ),
                );
              },
              child: customCard(event),
            );
          }),
    );
  }
}
