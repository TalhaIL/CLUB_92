import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Card customCard(EventModal event,
    {bool isUpcoming = false, EventController? controller}) {
  return Card(
    color: textFieldColor.withOpacity(0.07),
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
                    style: TextStyle(color: greenColor),
                  ),
                  controller!.isAllEvents.value
                      ? const Icon(Icons.notifications)
                      : Text(
                          'Edit',
                          style: TextStyle(color: greenColor),
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
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.flag,
                    color: greenColor,
                    size: 17,
                  )
                ],
              ),
              if (event.ticketAmount != null)
                Container(
                  width: 45,
                  height: 25,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Center(
                        child: Text(
                          '\$${event.ticketAmount}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ],
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            event.eventName,
            style: const TextStyle(fontSize: 14, color: Colors.white),
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
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          event.listeners.toString(),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 13,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          '20',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      event.coHost[1].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          event.coHost[2].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.mic,
                          size: 15,
                          color: Colors.white,
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
