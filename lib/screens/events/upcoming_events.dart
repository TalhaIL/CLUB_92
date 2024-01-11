import 'package:club_92/components/resuableMethods/custom_card.dart';
import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/screens/events/add_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({super.key});
  final EventController _eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _eventController.isAllEvents.value = true;
                  },
                  child: Obx(
                    () => Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: _eventController.isAllEvents.value
                            ? textFieldColor.withOpacity(0.09)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: greenColor,
                        ),
                      ),
                      child: const Center(
                        child: Text('All'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _eventController.isAllEvents.value = false;
                  },
                  child: Obx(
                    () => Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: _eventController.isAllEvents.value
                            ? Colors.transparent
                            : textFieldColor.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: greenColor,
                        ),
                      ),
                      child: const Center(
                        child: Text('My Events'),
                      ),
                    ),
                  ),
                ),
                CustomMaterialButton(
                  onPress: () {
                    Get.to(
                      AddEventSceen(),
                    );
                  },
                  text: 'Add Event',
                  width: 120,
                )
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 90, top: 15),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _eventController.isAllEvents.value
                      ? _eventController.upcomingEvents.length
                      : 2,
                  itemBuilder: (context, index) {
                    var event = _eventController.upcomingEvents[index];
                    return customCard(event,
                        isUpcoming: true, controller: _eventController);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
