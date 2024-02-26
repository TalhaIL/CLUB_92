import 'package:club_92/components/reusableWidgets/custom_ticket.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:club_92/screens/events/add_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
                        ? const Icon(
                            Icons.notifications,
                          )
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
            if (!isUpcoming)
              Column(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcATop,
                    ),
                    child: Lottie.asset(
                      'assets/animations/live_streaming.json',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      event.eventName,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (event.ticketAmount != null)
                  CustomTicket(
                    ticketAmount: event.ticketAmount.toString(),
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
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
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(30),
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
                          Icon(
                            Icons.mic,
                            color: Theme.of(context).colorScheme.primary,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        event.coHost[1].name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Row(
                        children: [
                          Text(
                            event.coHost[2].name,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.mic,
                            size: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  liveStatsData(context)
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

  Column liveStatsData(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
          ],
        ),
        const SizedBox(
          height: 10,
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
          height: 10,
        ),
        const Row(
          children: [
            Icon(
              Icons.person_outline_rounded,
              size: 13,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              '20',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
