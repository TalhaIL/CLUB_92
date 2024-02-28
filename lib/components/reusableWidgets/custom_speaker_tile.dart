import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:club_92/utils/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSpeakerTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final bool isEvents;
  final bool isSearchSceen;
  final bool isStartRoom;
  final bool isRaiseHands;
  final int index;
  const CustomSpeakerTile({
    super.key,
    this.isSearchSceen = false,
    this.isEvents = false,
    this.isStartRoom = false,
    this.isRaiseHands = false,
    required this.index,
    required this.profileImage,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCachedNetworkImage(
              profileImage: profileImage,
              height: 60,
              width: 60,
            ),
            isStartRoom == true || isRaiseHands == true
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: isSearchSceen || isEvents
                        ? MediaQuery.of(context).size.width * 0.38
                        : MediaQuery.of(context).size.width * 0.53,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
            isSearchSceen || isEvents
                ? Obx(
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                : isStartRoom || isRaiseHands
                    ? Obx(
                        () => GestureDetector(
                          onTap: () {
                            listOfSpeakers[index].isSelected.value =
                                !listOfSpeakers[index].isSelected.value;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: listOfSpeakers[index].isSelected.value
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: listOfSpeakers[index].isSelected.value
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  isRaiseHands ? 'invited' : 'Room',
                                  style: TextStyle(
                                    color:
                                        listOfSpeakers[index].isSelected.value
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  isRaiseHands ? Icons.mic : Icons.lock,
                                  color: listOfSpeakers[index].isSelected.value
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : const Row(
                        children: [
                          Text(
                            '3m ago',
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
