import 'dart:developer';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/top_speaker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final SpeakerController controller = Get.put(SpeakerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Activity'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  log(index.toString());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.listOfSpeakers[index].profileImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.53,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.listOfSpeakers[index].name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text('3m ago')
                  ],
                ),
              ),
            ),
            itemCount: controller.listOfSpeakers.length,
          )),
    );
  }
}
