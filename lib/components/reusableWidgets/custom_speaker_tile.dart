import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:flutter/material.dart';

class CustomSpeakerTile extends StatelessWidget {
  const CustomSpeakerTile({
    super.key,
    required this.index,
    this.isSearchSceen = false,
  });
  final bool isSearchSceen;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    listOfSpeakers[index].profileImage,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              width: isSearchSceen
                  ? MediaQuery.of(context).size.width * 0.38
                  : MediaQuery.of(context).size.width * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfSpeakers[index].name,
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
            isSearchSceen
                ? CustomMaterialButton(
                    onPress: () {},
                    text: 'Follow',
                    width: 85,
                    height: 40,
                    isSearch: true,
                  )
                : const Text(
                    '3m ago',
                  )
          ],
        ),
      ),
    );
  }
}
