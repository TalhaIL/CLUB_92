import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/core/constants/live_events.dart';
import 'package:club_92/core/constants/speaker.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/controllers/google_ads/google_ad.dart';
import 'package:club_92/screens/chat/chat_list.dart';
import 'package:club_92/screens/events/live_events_screen.dart';
import 'package:club_92/screens/events/main_event.dart';
import 'package:club_92/screens/events/upcoming_events_screen.dart';
import 'package:club_92/screens/notification/notification.dart';
import 'package:club_92/screens/profile/profile_screen.dart';
import 'package:club_92/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final adController = Get.put(GoogleAdController());

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    adController.initBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              borderSide: BorderSide(color: appColor, width: 2),
            ),
            labelColor: appColor,
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
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'UPCOMING',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(SearchScreen.route);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(ChatListScreen.route);
            },
            icon: const Icon(
              Icons.chat,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(NotificationScreen.route);
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                ProfileScreen.route,
                arguments: listOfSpeakers[0],
              );
            },
            child: const CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CustomMaterialButton(
          onPress: () {
            showModalBottomSheet(
              backgroundColor: Theme.of(context).colorScheme.background,
              context: context,
              builder: (context) => const StartRoomSheet(),
            );
          },
          width: 130,
          child: const SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Start a Event',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ).animate().fade().scaleX(delay: 100.ms),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: const [
          LiveEvents(),
          UpcomingEvents(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => Visibility(
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          visible: adController.isAdLoaded.value,
          child: SizedBox(
            height: adController.bannerAd.size.height.toDouble(),
            width: adController.bannerAd.size.width.toDouble(),
            child: AdWidget(
              ad: adController.bannerAd,
            ),
          ),
        ),
      ),
    );
  }
}

class StartRoomSheet extends StatefulWidget {
  const StartRoomSheet({
    super.key,
  });

  @override
  State<StartRoomSheet> createState() => _StartRoomSheetState();
}

class _StartRoomSheetState extends State<StartRoomSheet> {
  String selectedPrivacy = 'Public';
  final homeController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Text(
                  'Start a Event',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
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
                        text: 'Start a event for a',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: ' People I choose',
                            style: TextStyle(
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
                      onPress: () {
                        Get.off(
                          () => MainEventScreen(
                              event: liveEvents[0], isMyEvent: true),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text(
                        'Start Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
                        index: index,
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

  GestureDetector selectPrivacyContainer({required privacy}) {
    return GestureDetector(
      onTap: () {
        homeController.selectedPrivacy.value = privacy;
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: homeController.selectedPrivacy.value == privacy
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            privacy,
            style: TextStyle(
              fontSize: 18,
              color: homeController.selectedPrivacy.value == privacy
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
