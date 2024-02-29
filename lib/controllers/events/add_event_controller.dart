import 'package:club_92/constants/color.dart';
import 'package:club_92/models/speaker_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxBool isSwitched = true.obs;
  RxBool showFirstAnimation = false.obs;
  RxBool showAnimation = false.obs;
  RxString selectedPrivacy = 'Public'.obs;
  List<String> privacies = ['Public', 'Social', 'Private'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ticketController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      barrierColor: appColor,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  List<Speaker> coHostOfAddEvent = [
    Speaker(
        name: 'Daniel',
        profileImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
    Speaker(
        name: 'Monalisa',
        profileImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
  ];
}
