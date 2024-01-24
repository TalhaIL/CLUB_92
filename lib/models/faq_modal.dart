import 'package:get/get.dart';

class FaqModal {
  final String question;
  final String answer;
  RxBool isVisible;

  FaqModal({
    required this.question,
    required this.answer,
    bool isVisible = true,
  }) : isVisible = isVisible.obs;
}
