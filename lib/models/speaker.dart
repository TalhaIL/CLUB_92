import 'package:get/get.dart';

class Speaker {
  String name;
  String profileImage;
  RxBool? isSelected;

  Speaker({
    required this.name,
    required this.profileImage,
    bool isSelected = false, // Use regular bool here
  }) : isSelected = isSelected.obs; // Convert to RxBool using .obs constructor
}
