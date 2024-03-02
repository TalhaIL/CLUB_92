class ChatModel {
  final String messageSender;
  final String profileImage;
  final String lastMessage;
  final DateTime time;

  ChatModel({
    required this.messageSender,
    required this.profileImage,
    required this.lastMessage,
    required this.time,
  });
}
