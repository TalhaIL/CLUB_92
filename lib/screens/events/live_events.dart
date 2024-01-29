import 'package:club_92/components/resuableMethods/custom_card.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/screens/events/main_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveEvents extends StatelessWidget {
  LiveEvents({super.key});
  final EventController _eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 100, top: 15),
          physics: const BouncingScrollPhysics(),
          itemCount: _eventController.liveEvents.length,
          itemBuilder: (context, index) {
            var event = _eventController.liveEvents[index];
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
