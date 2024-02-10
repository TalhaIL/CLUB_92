class ChatModel {
  final String sender;
  final String profileImage;
  final String lastMessage;
  final DateTime time;

  ChatModel({
    required this.sender,
    required this.profileImage,
    required this.lastMessage,
    required this.time,
  });
}
