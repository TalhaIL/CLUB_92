import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/room_list.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:club_92/screens/Settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        actions: [
          CustomMaterialButton(
            onPress: () {},
            height: 40,
            width: 50,
            text: 'Buy this app',
          ),
          IconButton(
            onPressed: () {},
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: greenColor),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
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
                        listOfSpeakers[0].name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(
                        listOfSpeakers[0].username.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.5),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listOfSpeakers[0].followers.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listOfSpeakers[0].following.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Followings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                listOfSpeakers[0].about.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  accountIconWithUrl(
                      icon: 'assets/icons/linkedinIcon.svg',
                      accountHandle: listOfSpeakers[0].linkedInHandle!),
                  accountIconWithUrl(
                      icon: 'assets/icons/youtubeIcon.svg',
                      accountHandle: listOfSpeakers[0].youtubeHandle!),
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
                      accountHandle: listOfSpeakers[0].twitterHandle!),
                  accountIconWithUrl(
                      icon: 'assets/icons/instagramIcon.svg',
                      accountHandle: listOfSpeakers[0].instaHandle!),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: textFieldColor,
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
                                color: greenColor,
                                fontSize: 15,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: greenColor,
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
                              color: greenColor,
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
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            listOfRooms[index].coverImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
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
