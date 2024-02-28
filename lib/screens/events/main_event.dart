import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/components/reusableWidgets/custom_ticket.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:club_92/screens/profile_screen.dart';
import 'package:club_92/utils/cached_network_image.dart';
import 'package:club_92/utils/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MainEventScreen extends StatefulWidget {
  final EventModal event;
  final bool isMyEvent;

  const MainEventScreen(
      {super.key, required this.event, this.isMyEvent = false});

  @override
  State<MainEventScreen> createState() => _MainEventScreenState();
}

class _MainEventScreenState extends State<MainEventScreen> {
  bool isContainerVisible = false;
  final controller = Get.put(
    EventController(),
  );

  @override
  void dispose() {
    controller.isMicOn.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 40,
          ),
        ),
        actions: [
          if (widget.event.ticketAmount != null)
            CustomTicket(
              ticketAmount: widget.event.ticketAmount.toString(),
            ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              customRoomRulesSheet(context);
            },
            icon: const Icon(
              Icons.event_note,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => ProfileScreen(
                  speaker: listOfSpeakers[0],
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                listOfSpeakers[0].profileImage,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.flag,
                      color: appColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.event.eventName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15.0,
                              mainAxisExtent: 120,
                              mainAxisSpacing: 0.0,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                shortProfileSheet(context, index);
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      MyCachedNetworkImage(
                                        profileImage:
                                            listOfSpeakers[index].profileImage,
                                        height: 70,
                                        width: 70,
                                        borderRadius: 25,
                                      ),
                                      (index % 2 == 0)
                                          ? Positioned(
                                              bottom: -2,
                                              right: -2,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                                child: ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    BlendMode.srcATop,
                                                  ),
                                                  child: Lottie.asset(
                                                    'assets/animations/mic_on.json',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Positioned(
                                              bottom: -2,
                                              right: -2,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                ),
                                                child: Align(
                                                  child: Icon(
                                                    Icons.mic,
                                                    size: 18,
                                                    color: transparentWhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listOfSpeakers[index].name,
                                  )
                                ],
                              ),
                            ),
                            itemCount: 7,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Other Listeners',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 0,
                              mainAxisExtent: 115,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                shortProfileSheet(context, index);
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            listOfSpeakers[index].profileImage,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listOfSpeakers[index].name,
                                  ),
                                ],
                              ),
                            ),
                            itemCount: listOfSpeakers.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isContainerVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: dialogContainer(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Container _bottomNavigationBar(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: transparentWhite.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Leave',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isContainerVisible = !isContainerVisible;
                });
              },
              icon: isContainerVisible
                  ? const Icon(Icons.close)
                  : const Icon(Icons.keyboard_control),
            ),
            if (widget.isMyEvent)
              GestureDetector(
                onTap: () {
                  customRaiseHandSheet(context);
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      bottom: 10,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Lottie.asset(
                      'assets/animations/raise_hand.json',
                      height: 60,
                      animate: false,
                      width: 70,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Center(child: Text('5')),
                      ),
                    )
                  ],
                ),
              ),
            controller.isMicOn.value || widget.isMyEvent
                ? GestureDetector(
                    onTap: () {
                      controller.isMicOn.value = !controller.isMicOn.value;
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          top: 28,
                          bottom: 20,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              appColor,
                              BlendMode.srcATop,
                            ),
                            child: Lottie.asset(
                              'assets/animations/mic_on.json',
                              height: 85,
                              width: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      _showRaiseDialog(context);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Raise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<dynamic> customRaiseHandSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Raised Hands',
                        style: TextStyle(fontSize: 18),
                      ),
                      Obx(
                        () => Switch(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: controller.isRaisedHandsEnable.value,
                            onChanged: (val) {
                              controller.isRaisedHandsEnable.value = val;
                            }),
                      )
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CustomSpeakerTile(
                          index: index,
                          isRaiseHands: true,
                          profileImage: listOfSpeakers[index].profileImage,
                          name: listOfSpeakers[index].name,
                        );
                      },
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Container dialogContainer(BuildContext context) {
    return Container(
      height: 190,
      width: 190,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: transparentWhite.withOpacity(0.05),
            offset: const Offset(2, 2),
            blurRadius: 5,
            spreadRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dialogContainerOption(text: 'Invite to Room'),
            dialogContainerOption(text: 'Search in Room'),
            dialogContainerOption(text: 'Report Room Activity'),
            dialogContainerOption(
                text: 'Review Clubroom Rules',
                onTap: () {
                  customRoomRulesSheet(context);
                }),
          ],
        ),
      ),
    );
  }

  InkWell dialogContainerOption({required text, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> _showRaiseDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shadowColor: Colors.black26,
          title: const Text(
            'Wait for 3 seconds',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: const CircularCountdownTimer(),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pop();
    }
    controller.isMicOn.value = true;
  }

  Future<dynamic> shortProfileSheet(BuildContext context, int index) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      context: context,
      builder: (context) => SizedBox(
        height: 400,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: appColor),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          listOfSpeakers[index].profileImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        listOfSpeakers[index].name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        listOfSpeakers[index].username.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  countAndText(
                    index,
                    count: listOfSpeakers[index].followers.toString(),
                    text: 'Followers',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  countAndText(
                    index,
                    count: listOfSpeakers[index].following.toString(),
                    text: 'Following',
                  ),
                  const Spacer(),
                  Obx(
                    () => CustomMaterialButton(
                      onPress: () {
                        listOfSpeakers[index].isFollowing.value =
                            !listOfSpeakers[index].isFollowing.value;
                      },
                      width: 100,
                      height: 40,
                      child: Text(
                        listOfSpeakers[index].isFollowing.value
                            ? 'Following'
                            : 'Follow',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                listOfSpeakers[index].about.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomMaterialButton(
                onPress: () {
                  Get.to(
                    () => ProfileScreen(
                      speaker: listOfSpeakers[index],
                    ),
                  );
                },
                child: const Text(
                  'Visit Full Profile',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column countAndText(int index, {required count, required text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  Future<dynamic> customRoomRulesSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      context: context,
      showDragHandle: true,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.event.eventName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.flag,
                    color: appColor.withOpacity(0.8),
                    size: 17,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Clubroom Rules',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    rulesHeaderAndText(
                        heading: 'Be Kind Always',
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac justo nec risus varius pellentesque. Nullam euismod, ligula vel eleifend interdum, justo lacus feugiat ex, ut ultrices ligula lectus vel ex. Quisque convallis augue id ante scelerisque, nec vulputate justo malesuada.'),
                    rulesHeaderAndText(
                        heading: 'Don\'t over react anyone',
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac justo nec risus varius pellentesque. Nullam euismod, ligula vel eleifend interdum, justo lacus feugiat ex, ut ultrices ligula lectus vel ex. Quisque convallis augue id ante scelerisque, nec vulputate justo malesuada.'),
                    rulesHeaderAndText(
                        heading: 'Dont\'t Abusive',
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac justo nec risus varius pellentesque. Nullam euismod, ligula vel eleifend interdum, justo lacus feugiat ex, ut ultrices ligula lectus vel ex. Quisque convallis augue id ante scelerisque, nec vulputate justo malesuada.')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column rulesHeaderAndText({heading, text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
