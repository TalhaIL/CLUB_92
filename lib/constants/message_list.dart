import 'package:club_92/models/chat_model.dart';

final List<ChatModel> chats = [
  ChatModel(
    sender: 'Rubic',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU",
    lastMessage: 'Hey, how are you?',
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  ChatModel(
    sender: 'Ailseen',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU",
    lastMessage: 'I\'m good, thanks! What about you?',
    time: DateTime.now().subtract(const Duration(minutes: 3)),
  ),
  ChatModel(
    sender: 'Sammy',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU",
    lastMessage: 'I\'m doing fine too. Just busy with work.',
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  ChatModel(
    sender: 'Monalisa',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU",
    lastMessage: 'Hey, how are you?',
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  ChatModel(
    sender: 'Derrick',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU",
    lastMessage: 'I\'m good, thanks! What about you?',
    time: DateTime.now().subtract(const Duration(minutes: 3)),
  ),
  ChatModel(
    sender: 'Glenn',
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU",
    lastMessage: 'I\'m doing fine too. Just busy with work.',
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
];
