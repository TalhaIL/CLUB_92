import 'package:club_92/models/room_modal.dart';
import 'package:get/get.dart';

class Speaker {
  String name;
  String? username;
  String profileImage;
  String? about;
  String? followers;
  String? following;
  RxBool? isSelected;
  String? twitterHandle;
  String? youtubeHandle;
  String? instaHandle;
  String? linkedInHandle;
  List<RoomModal>? memberOf;

  Speaker({
    required this.name,
    required this.profileImage,
    this.username,
    this.about,
    this.followers,
    this.following,
    this.instaHandle,
    this.linkedInHandle,
    this.memberOf,
    this.twitterHandle,
    this.youtubeHandle,
    bool isSelected = false, // Use regular bool here
  }) : isSelected = isSelected.obs; // Convert to RxBool using .obs constructor
}
