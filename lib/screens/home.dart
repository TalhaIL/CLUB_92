import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:club_92/screens/events/live_events.dart';
import 'package:club_92/screens/events/upcoming_events.dart';
import 'package:club_92/screens/notification.dart';
import 'package:club_92/screens/profile_screen.dart';
import 'package:club_92/screens/search_screen.dart';
import 'package:club_92/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leadingWidth: 140,
        leading: SizedBox(
          width: 120,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            isScrollable: true,
            dividerHeight: 0,
            indicator: UnderlineTabIndicator(
              insets: const EdgeInsets.only(
                top: 5,
              ),
              borderSide: BorderSide(color: greenColor, width: 2),
            ),
            labelColor: greenColor,
            labelPadding: const EdgeInsets.only(
              bottom: 10,
              right: 15,
              left: 15,
              top: 15,
            ),
            physics: const BouncingScrollPhysics(),
            tabs: const [
              Text(
                'LIVE',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'UPCOMING',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const SearchScreen(),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                () => WalletScreen(),
              );
            },
            icon: const Icon(
              Icons.wallet,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomMaterialButton(
          onPress: () {
            showModalBottomSheet(
              backgroundColor: const Color(0xff20283b),
              context: context,
              builder: (context) => const StartRoom(),
            );
          },
          text: 'Start a room',
          width: 130,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: [
          LiveEvents(),
          UpcomingEvents(),
        ],
      ),
    );
  }
}

class StartRoom extends StatelessWidget {
  const StartRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Start a Room',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectPrivacyContainer(privacy: 'Public'),
                const SizedBox(
                  width: 10,
                ),
                selectPrivacyContainer(privacy: 'Social'),
                const SizedBox(
                  width: 10,
                ),
                selectPrivacyContainer(privacy: 'Private'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Start a room for a',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: ' People I choose',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(hintText: 'Add a topic'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomMaterialButton(
                      height: 45,
                      width: 120,
                      onPress: () {},
                      text: 'Start Now',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Start a private chat room',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: ' with online friends',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listOfSpeakers.length,
                      itemBuilder: (context, index) => CustomSpeakerTile(
                        profileImage: listOfSpeakers[index].profileImage,
                        name: listOfSpeakers[index].name,
                        isStartRoom: true,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container selectPrivacyContainer({required privacy}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: textFieldColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        privacy,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
