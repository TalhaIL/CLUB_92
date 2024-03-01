import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/room_list.dart';
import 'package:club_92/models/speaker_modal.dart';
import 'package:club_92/screens/Settings/setting_screen.dart';
import 'package:club_92/screens/wallet.dart';
import 'package:club_92/utils/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final Speaker speaker;
  const ProfileScreen({super.key, required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                () => const SettingScreen(),
              );
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
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
                  ]),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {},
                            child: const Text('22k followers'),
                          ),
                          MaterialButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {},
                            child: const Text('20 following'),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomMaterialButton(
                onPress: () {},
                child: Text(
                  'Edit Profile',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              // Row(
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           speaker.followers.toString(),
              //           style: const TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           'Followers',
              //           style: Theme.of(context).textTheme.bodySmall,
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           speaker.following.toString(),
              //           style: const TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           'Followings',
              //           style: Theme.of(context).textTheme.bodySmall,
              //         )
              //       ],
              //     )
              //   ],
              // ),

              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                backgroundColor: Theme.of(context).colorScheme.surface,
                collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('About'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      speaker.about.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionTile(
                backgroundColor: Theme.of(context).colorScheme.surface,
                collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('Social Handles'),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      accountIconWithUrl(
                          icon: 'assets/icons/linkedinIcon.svg',
                          accountHandle: speaker.linkedInHandle!),
                      accountIconWithUrl(
                          icon: 'assets/icons/youtubeIcon.svg',
                          accountHandle: speaker.youtubeHandle!),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      accountIconWithUrl(
                          icon: 'assets/icons/twitterIcon.svg',
                          accountHandle: speaker.twitterHandle!),
                      accountIconWithUrl(
                          icon: 'assets/icons/instagramIcon.svg',
                          accountHandle: speaker.instaHandle!),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                backgroundColor: Theme.of(context).colorScheme.surface,
                collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('Upcoming Event'),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Members of',
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

  Row accountIconWithUrl(
      {required String icon, required String accountHandle}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 30,
          width: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          accountHandle,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
