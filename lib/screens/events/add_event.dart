import 'dart:developer';

import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/components/reusableWidgets/custom_text_field.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/controllers/events/add_event_controller.dart';
import 'package:club_92/models/event_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventSceen extends StatefulWidget {
  final bool isUpdateEvent;
  final EventModal? event;
  const AddEventSceen({
    super.key,
    this.isUpdateEvent = false,
    this.event,
  });

  @override
  State<AddEventSceen> createState() => _AddEventSceenState();
}

class _AddEventSceenState extends State<AddEventSceen> {
  final AddEventController _addEventController = Get.put(
    AddEventController(),
  );

  @override
  void initState() {
    _addEventController.nameController.text = widget.event?.eventName ?? '';
    _addEventController.ticketController.text =
        widget.event?.ticketAmount.toString() ?? '';
    _addEventController.descriptionController.text =
        widget.event?.eventDescription.toString() ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _addEventController.nameController.dispose();
    _addEventController.ticketController.dispose();
    _addEventController.descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text(
          'ADD EVENT',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          widget.isUpdateEvent
              ? CustomMaterialButton(
                  onPress: () {},
                  width: 120,
                  child: const Text('Update'),
                )
              : CustomMaterialButton(
                  onPress: () {},
                  width: 120,
                  child: const Text('Publish'),
                ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
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
                        padding: const EdgeInsets.only(bottom: 7),
                        child: cohostTile(
                          text:
                              _addEventController.coHostOfAddEvent[index].name,
                          url: _addEventController
                              .coHostOfAddEvent[index].profileImage,
                          showCloseIcon: index == 1 ? true : false,
                        ),
                      );
                    },
                    itemCount: _addEventController.coHostOfAddEvent.length,
                  ),
                  cohostTile(text: 'Add Co-host or Guest', isAddCoHost: true),
                ],
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
                      activeColor: greenColor,
                      value: _addEventController.isSwitched.value,
                      onChanged: (val) {
                        _addEventController.isSwitched.value = val;
                        log(_addEventController.isSwitched.value.toString());
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
            borderRadius: BorderRadius.circular(20), color: textFieldColor),
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
        color: textFieldColor,
        border: Border.all(
          color: Colors.blueGrey.withOpacity(
            0.2,
          ),
          width: 1.0,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              isAddCoHost
                  ? CircleAvatar(
                      backgroundColor: greenColor,
                      maxRadius: 25,
                      child: const Icon(Icons.add),
                    )
                  : CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(
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
