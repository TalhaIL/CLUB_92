import 'package:club_92/components/reusableWidgets/custom_ticket.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:club_92/screens/events/add_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final bool isUpcoming;
  final EventModal event;
  final EventController? controller;

  const CustomCard(
      {super.key,
      required this.event,
      required this.isUpcoming,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.surface,
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isUpcoming)
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today, 6:00pm',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    controller!.isAllEvents.value
                        ? const Icon(Icons.notifications)
                        : GestureDetector(
                            onTap: () {
                              Get.to(
                                () => AddEventSceen(
                                  isUpdateEvent: true,
                                  event: event,
                                ),
                              );
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            if (isUpcoming)
              const SizedBox(
                height: 10,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.flag,
                      color: Theme.of(context).colorScheme.primary,
                      size: 17,
                    )
                  ],
                ),
                if (event.ticketAmount != null)
                  CustomTicket(
                    ticketAmount: event.ticketAmount.toString(),
                  )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              event.eventName,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (isUpcoming)
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: event.coHost.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(
                                event.coHost[index].profileImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(event.coHost[index].name)
                      ],
                    ),
                  ),
                ),
              ),
            if (!isUpcoming)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    event.coHost[0].profileImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 45,
                              child: Container(
                                height: 60,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      event.coHost[1].profileImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 95,
                              child: Container(
                                height: 60,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      event.coHost[2].profileImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.hearing,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            event.listeners.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Icon(
                            Icons.person_outline_rounded,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            '20',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            event.coHost[0].name,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.mic,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        event.coHost[1].name,
                      ),
                      Row(
                        children: [
                          Text(
                            event.coHost[2].name,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.mic,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            if (isUpcoming)
              Text(
                event.eventDescription.toString(),
                style: const TextStyle(fontSize: 12),
              )
          ],
        ),
      ),
    );
  }
}
