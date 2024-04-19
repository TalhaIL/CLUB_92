import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_92/core/constants/live_events.dart';
import 'package:club_92/screens/events/main_event.dart';
import 'package:club_92/core/utils/instruction_dialog.dart';
import 'package:club_92/core/components/reusableWidgets/alert_dialog.dart';
import 'package:club_92/core/components/reusableWidgets/custom_button.dart';
import 'package:club_92/core/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/core/constants/color.dart';
import 'package:club_92/controllers/events/add_event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEventScreen extends StatefulWidget {
  static const String route = 'add-event-screen';
  final bool isUpdateEvent;
  final Event? event;
  const AddEventScreen({
    super.key,
    required this.isUpdateEvent,
    this.event,
  });

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen>
    with SingleTickerProviderStateMixin {
  final _addEventController = Get.put(AddEventController());
  void _checkInstructionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shown = prefs.getBool('isAddEventInstructionShown') ?? false;
    if (!shown) {
      if (mounted) {
        instructionDialog(
            context: context,
            title: 'Instruction',
            content: 'Click on Add button to see animation');
      }
      prefs.setBool('isAddEventInstructionShown', true);
    }
  }

  @override
  void initState() {
    _addEventController.nameController.text = widget.event?.eventName ?? '';
    _addEventController.ticketController.text =
        widget.event?.ticketAmount.toString() ?? '';
    _addEventController.descriptionController.text =
        widget.event?.eventDescription.toString() ?? '';

    _checkInstructionStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          widget.isUpdateEvent
              ? CustomMaterialButton(
                  onPress: () {},
                  width: 120,
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )
              : Row(
                  children: [
                    CustomMaterialButton(
                      onPress: () {},
                      width: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Schedule',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomMaterialButton(
                      width: 100,
                      onPress: () {
                        _addEventController.showFirstAnimation.value = true;
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.upload,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Start Now',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Event name',
                    controller: _addEventController.nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Select Co-host or Guest'),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: cohostTile(
                              text: _addEventController
                                  .coHostOfAddEvent[index].name,
                              url: _addEventController
                                  .coHostOfAddEvent[index].profileImage,
                              showCloseIcon: index == 1 ? true : false,
                            ),
                          );
                        },
                        itemCount: _addEventController.coHostOfAddEvent.length,
                      ),
                      cohostTile(
                          text: 'Add Co-host or Guest', isAddCoHost: true),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Select privacy of your event'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Obx(
                        () => Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _addEventController.selectedPrivacy.value =
                                      _addEventController.privacies[index];
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: _addEventController
                                              .selectedPrivacy.value ==
                                          _addEventController.privacies[index]
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context)
                                          .colorScheme
                                          .surface
                                          .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    _addEventController.privacies[index],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      itemCount: _addEventController.privacies.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Select Event date and time'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      eventDateTime(
                          context: context,
                          icon: Icons.calendar_today_outlined,
                          onTap: () {
                            _addEventController.selectDate(context);
                          },
                          isDate: true),
                      const SizedBox(
                        width: 20,
                      ),
                      eventDateTime(
                        context: context,
                        icon: Icons.access_time,
                        onTap: () {
                          _addEventController.selectTime(context);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Paid Event?'),
                        Switch(
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: _addEventController.isSwitched.value,
                          onChanged: (val) {
                            _addEventController.isSwitched.value = val;
                            log(_addEventController.isSwitched.value
                                .toString());
                          },
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: _addEventController.isSwitched.value,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Enter Ticket amount in (\$)',
                            controller: _addEventController.ticketController,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Text('Description'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    controller: _addEventController.descriptionController,
                    maxLines: 5,
                  )
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: _addEventController.showFirstAnimation.value,
                child: uploadingTimerAnimation(context),
              ),
            ),
            Obx(
              () => Visibility(
                visible: _addEventController.showAnimation.value,
                child: uploadingRocketAnimation(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned uploadingTimerAnimation(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: Lottie.asset(
              'assets/animations/timer_animation.json',
              width: double.infinity,
              height: double.infinity,
              reverse: false,
              animate: true,
              repeat: false,
              onLoaded: (composition) {
                Future.delayed(
                  composition.duration,
                  () {
                    _addEventController.showAnimation.value = true;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Positioned uploadingRocketAnimation(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Lottie.asset(
            'assets/animations/rocket_animation.json',
            width: double.infinity,
            height: double.infinity,
            reverse: false,
            animate: true,
            repeat: false,
            onLoaded: (composition) {
              Future.delayed(
                composition.duration,
                () {
                  _alertDialog(
                    context: context,
                    title: 'Started',
                    content: 'Event Started Successfully',
                  );
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      _addEventController.showFirstAnimation.value = false;
                      _addEventController.showAnimation.value = false;
                      Get.off(
                        () => MainEventScreen(
                            event: liveEvents[0], isMyEvent: true),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _alertDialog(
      {required BuildContext context, title, content}) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: title,
        content: content,
      ),
    );
  }

  GestureDetector eventDateTime(
      {required BuildContext context,
      required IconData icon,
      Function()? onTap,
      bool isDate = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Obx(
                () => Text(
                  isDate
                      ? '${_addEventController.selectedDate.value.day}/${_addEventController.selectedDate.value.month}/${_addEventController.selectedDate.value.year}'
                      : _addEventController.selectedTime.value.format(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container cohostTile({
    String? text,
    String? url,
    bool isAddCoHost = false,
    bool showCloseIcon = false,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.1,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              isAddCoHost
                  ? CircleAvatar(
                      backgroundColor: appColor,
                      maxRadius: 25,
                      child: const Icon(Icons.add),
                    )
                  : CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                        url.toString(),
                      ),
                    ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text.toString(),
              ),
              const Spacer(),
              showCloseIcon
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}
