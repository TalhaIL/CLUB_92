class RoomModal {
  String name;
  String coverImage;
  String? members;
  String? followers;

  RoomModal(
      {required this.name,
      required this.coverImage,
      this.members,
      this.followers});
}
