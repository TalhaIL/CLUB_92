import 'package:club_92/models/speaker_modal.dart';

class EventModal {
  final String title;
  final String eventName;
  final String? eventDescription;
  final String? eventDate;
  final List<Speaker> coHost;
  final int? ticketAmount;
  bool? live;
  final int? listeners;
  final bool? isOwner;

  EventModal({
    required this.title,
    required this.eventName,
    this.eventDescription,
    this.eventDate,
    required this.coHost,
    this.ticketAmount,
    this.live,
    this.listeners,
    this.isOwner,
  });
}
