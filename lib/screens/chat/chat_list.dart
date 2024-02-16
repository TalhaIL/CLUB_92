import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/message_list.dart';
import 'package:club_92/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(chats[index].sender),
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
                radius: 30,
                backgroundImage: NetworkImage(
                  chats[index].profileImage,
                ),
              ),
              title: SizedBox(
                child: Text(
                  chats[index].sender,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text(
                chats[index].lastMessage,
                style: Theme.of(context).primaryTextTheme.bodySmall,
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
    );
  }
}
