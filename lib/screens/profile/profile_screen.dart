import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/constants/room_list.dart';
import 'package:club_92/models/speaker_modal.dart';
import 'package:club_92/screens/settings/setting_screen.dart';
import 'package:club_92/screens/auth/register/username.dart';
import 'package:club_92/screens/wallet/wallet_screen.dart';
import 'package:club_92/core/utils/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/profile-screen';
  final Speaker speaker;
  const ProfileScreen({super.key, required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(WalletScreen.route);
            },
            icon: const Icon(
              Icons.wallet,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(SettingScreen.route);
            },
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              speaker.profileImage,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        speaker.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 25),
                      ),
                      Text(
                        speaker.username.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          accountIconWithUrl(
                            icon: 'assets/icons/linkedinIcon.svg',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          accountIconWithUrl(
                            icon: 'assets/icons/youtubeIcon.svg',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          accountIconWithUrl(
                            icon: 'assets/icons/twitterIcon.svg',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          accountIconWithUrl(
                            icon: 'assets/icons/instagramIcon.svg',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                speaker.followers.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                ' followers',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                speaker.following.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                ' following',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                child: CustomMaterialButton(
                  onPress: () {
                    Get.toNamed(
                      AddUserDetailsScreen.route,
                      arguments: true,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Me',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      speaker.about.toString(),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today 8:30 pm',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Discuss over pollution control',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text('FROM WORLD WARRIORS'),
                            Icon(
                              Icons.flag,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Member of',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: MyCachedNetworkImage(
                        profileImage: listOfRooms[index].coverImage,
                        height: 60,
                        width: 60,
                      )),
                  itemCount: listOfRooms.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionTile customExpansionTile(BuildContext context, {title, children}) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).colorScheme.surface,
      collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title),
      children: children,
    );
  }

  SvgPicture accountIconWithUrl({
    required String icon,
  }) {
    return SvgPicture.asset(
      icon,
      height: 30,
      width: 30,
    );
  }
}
