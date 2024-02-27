import 'package:club_92/components/resuableMethods/custom_card.dart';
import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/components/reusableWidgets/custom_ticket.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/upcoming_events.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/models/event_modal.dart';
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
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: appColor,
                          width: 0.2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: _eventController.isAllEvents.value
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
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
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: appColor, width: 0.2),
                      ),
                      child: Center(
                        child: Text(
                          'My Events',
                          style: TextStyle(
                            color: !_eventController.isAllEvents.value
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomMaterialButton(
                  onPress: () {
                    Get.to(
                      () => const AddEventSceen(),
                    );
                  },
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add Event',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
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
                      ? upcomingEvents.length
                      : 2,
                  itemBuilder: (context, index) {
                    var event = upcomingEvents[index];
                    return GestureDetector(
                      onTap: () {
                        upcomingEventsSheet(context, event);
                      },
                      child: CustomCard(
                        event: event,
                        isUpcoming: true,
                        controller: _eventController,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> upcomingEventsSheet(BuildContext context, EventModal event) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      showDragHandle: false,
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(
              thickness: 3,
              indent: 130,
              endIndent: 130,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today 6:00 pm',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomTicket(
                          ticketAmount: event.ticketAmount.toString(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.eventName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                event.title,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.flag,
                                color: appColor,
                                size: 17,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            event.eventDescription.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mentors',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => CustomSpeakerTile(
                              name: event.coHost[index].name,
                              profileImage: event.coHost[index].profileImage,
                              isEvents: true,
                              index: index,
                            ),
                            itemCount: event.coHost.length,
                          ),
                          const SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xff20283b), Colors.transparent])),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '\$${event.ticketAmount}',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Text(
                                'Charge',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          _eventController.isAllEvents.value
                              ? CustomMaterialButton(
                                  height: 45,
                                  onPress: () {},
                                  child: const Text(
                                    'Buy a Ticket',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : CustomMaterialButton(
                                  height: 45,
                                  onPress: () {
                                    Get.to(
                                      () => AddEventSceen(
                                        isUpdateEvent: true,
                                        event: event,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Edit Event',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
