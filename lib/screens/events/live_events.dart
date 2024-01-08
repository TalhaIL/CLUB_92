import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/event_controller.dart';
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
          physics: const BouncingScrollPhysics(),
          itemCount: _eventController.liveEvents.length,
          itemBuilder: (context, index) {
            var event = _eventController.liveEvents[index];
            return Card(
              color: textFieldColor.withOpacity(0.07),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              event.title,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
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
                            height: 25,
                            width: 40,
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
                            const Text(
                              'Daniel',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
