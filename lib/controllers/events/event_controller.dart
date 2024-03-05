import 'package:get/get.dart';

class EventController extends GetxController {
  RxBool isAllEvents = true.obs;
  RxBool isMicOn = false.obs;
  RxBool isRaisedHandsEnable = true.obs;
  Rx<String> selectedPrivacy = 'Public'.obs;
}
