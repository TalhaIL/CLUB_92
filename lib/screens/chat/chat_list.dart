import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/screens/chat/new_chat_list.dart';
import 'package:club_92/core/utils/instruction_dialog.dart';
import 'package:club_92/core/constants/message_list.dart';
import 'package:club_92/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatListScreen extends StatefulWidget {
  static const String route = '/chat-list-screen';
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  void _checkInstructionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shown = prefs.getBool('isChatListInstructionShown') ?? false;
    if (!shown) {
      if (mounted) {
        instructionDialog(
            context: context,
            title: 'Instruction',
            content: 'Swipe to delete conservation');
      }
      prefs.setBool('isChatListInstructionShown', true);
    }
  }

  @override
  void initState() {
    _checkInstructionStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          CustomMaterialButton(
            width: 120,
            onPress: () {
              Get.toNamed(NewChatScreen.route);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Start New Chat',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: chats.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(chats[index].messageSender),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  chats.removeAt(index);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: CachedNetworkImageProvider(
                      chats[index].profileImage,
                    ),
                  ),
                  title: SizedBox(
                    child: Text(
                      chats[index].messageSender,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    chats[index].lastMessage,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          sender: chats[index],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('End-to-End Encrypted'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.lock,
                size: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
