import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_ticket.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:club_92/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MainEventScreen extends StatefulWidget {
  final EventModal event;

  const MainEventScreen({super.key, required this.event});

  @override
  State<MainEventScreen> createState() => _MainEventScreenState();
}

class _MainEventScreenState extends State<MainEventScreen> {
  bool isContainerVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 50,
          ),
        ),
        actions: [
          if (widget.event.ticketAmount != null)
            CustomTicket(
              ticketAmount: widget.event.ticketAmount.toString(),
            ),
          IconButton(
            onPressed: () {
              customRoomRulesSheet(context);
            },
            icon: const Icon(
              Icons.event_note,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const ProfileScreen(),
              );
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
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
                    Text(widget.event.title),
                    Icon(
                      Icons.flag,
                      color: greenColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.event.eventName,
                  style: const TextStyle(fontSize: 18),
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
                    color: appColor.withOpacity(0.8),
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
                            itemBuilder: (context, index) => Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            listOfSpeakers[index].profileImage,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -2,
                                      right: -2,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: appColor.withOpacity(0.6),
                                        ),
                                        child: Align(
                                          child: Icon(
                                            Icons.mic,
                                            size: 20,
                                            color: greenColor,
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
                                showModalBottomSheet(
                                  backgroundColor:
                                      const Color(0xff505666).withOpacity(0.97),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.more_vert_outlined,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
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
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: greenColor),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      listOfSpeakers[index]
                                                          .profileImage,
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
                                                    style: const TextStyle(
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    listOfSpeakers[index]
                                                        .username
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
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
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listOfSpeakers[0]
                                                        .followers
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Followers',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listOfSpeakers[0]
                                                        .following
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Followings',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              CustomMaterialButton(
                                                onPress: () {},
                                                text: 'Follow',
                                                width: 100,
                                                height: 40,
                                                isSearch: true,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            listOfSpeakers[index]
                                                .about
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomMaterialButton(
                                            onPress: () {},
                                            text: 'Visit Full Profile',
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          listOfSpeakers[index].profileImage,
                                        ),
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
                    child: Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        color: const Color(0xff505666).withOpacity(0.97),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Invite to Room',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Search in Room',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Report Room Activity',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                customRoomRulesSheet(context);
                              },
                              child: const Text(
                                'Review Clubroom Rules',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Leave',
                  style: TextStyle(
                    color: Colors.white,
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
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: greenColor,
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
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> customRoomRulesSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: const Color(0xff505666).withOpacity(0.97),
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
                    widget.event.title,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.flag,
                    color: greenColor.withOpacity(0.8),
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.9),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
