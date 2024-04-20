import 'package:club_92/core/constants/speaker.dart';
import 'package:club_92/screens/chat/chat_screen.dart';
import 'package:club_92/core/utils/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewChatScreen extends StatelessWidget {
  static const String route = 'new-chat-screen';
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Chat'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            onTap: () {
              Get.toNamed(
                ChatScreen.route,
                arguments: {
                  'newReceiver': listOfSpeakers[index],
                },
              );
            },
            leading: MyCachedNetworkImage(
                profileImage: listOfSpeakers[index].profileImage),
            title: Text(
              listOfSpeakers[index].name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Row(
              children: [
                Text(listOfSpeakers[index].followers.toString()),
                Text(
                  ' Followers',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            trailing: Icon(
              Icons.chat,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        itemCount: listOfSpeakers.length,
      ),
    );
  }
}
