import 'package:club_92/models/event_modal.dart';
import 'package:club_92/models/speaker_modal.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  RxBool isAllEvents = false.obs;
  List<EventModal> liveEvents = [
    EventModal(
      title: 'APP UI DESIGN',
      eventName: 'Basics of User Interface Design',
      coHost: [
        Speaker(
          name: 'Gilbert',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU",
        ),
        Speaker(
          name: 'Marian',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU",
        ),
        Speaker(
          name: 'Dave',
          profileImage:
              "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg",
        ),
      ],
      listeners: 250,
      ticketAmount: 9,
    ),
    EventModal(
      title: 'UNITED PHOTOGRAPHY CAMERA',
      eventName: 'World Camera Day | First Camera',
      coHost: [
        Speaker(
          name: 'Gilbert',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU",
        ),
        Speaker(
          name: 'Marian',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU",
        ),
        Speaker(
          name: 'Dave',
          profileImage:
              "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg",
        ),
      ],
      listeners: 187,
    ),
    EventModal(
      title: 'APP UI DESIGN',
      eventName: 'Basics of User Interface Design',
      coHost: [
        Speaker(
          name: 'Gilbert',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU",
        ),
        Speaker(
          name: 'Marian',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU",
        ),
        Speaker(
          name: 'Dave',
          profileImage:
              "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg",
        ),
      ],
      listeners: 250,
      ticketAmount: 6,
    ),
    EventModal(
      title: 'UNITED PHOTOGRAPHY CAMERA',
      eventName: 'World Camera Day | First Camera',
      coHost: [
        Speaker(
          name: 'Gilbert',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU",
        ),
        Speaker(
          name: 'Marian',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU",
        ),
        Speaker(
          name: 'Dave',
          profileImage:
              "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg",
        ),
      ],
      listeners: 185,
    ),
    EventModal(
      title: 'UNITED PHOTOGRAPHY CAMERA',
      eventName: 'World Camera Day | First Camera',
      coHost: [
        Speaker(
          name: 'Gilbert',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU",
        ),
        Speaker(
          name: 'Marian',
          profileImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU",
        ),
        Speaker(
          name: 'Dave',
          profileImage:
              "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg",
        ),
      ],
      listeners: 150,
      ticketAmount: 12,
    ),
  ];
  List<EventModal> upcomingEvents = [
    EventModal(
        title: 'APP UI DESIGN',
        eventName: 'Basics of User Interface Design',
        coHost: [
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
        ],
        eventDescription:
            'The Room for beginners to ask questions and get advice from more experienced forum members.',
        eventDate: 'Today, 6:00 pm',
        ticketAmount: 9),
    EventModal(
        title: 'UNITED PHOTOGRAPHY CAMERA',
        eventName: 'World Camera Day | First Camera',
        coHost: [
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
        ],
        eventDescription:
            'The Room for beginners to ask questions and get advice from more experienced forum members.',
        eventDate: 'Today, 6:00 pm',
        ticketAmount: 9),
    EventModal(
        title: 'APP UI DESIGN',
        eventName: 'Basics of User Interface Design',
        coHost: [
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
        ],
        eventDescription:
            'The Room for beginners to ask questions and get advice from more experienced forum members.',
        eventDate: 'Today, 6:00 pm',
        ticketAmount: 12),
    EventModal(
        title: 'UNITED PHOTOGRAPHY CAMERA',
        eventName: 'World Camera Day | First Camera',
        coHost: [
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
          Speaker(
              name: 'Ailseen',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
          Speaker(
              name: 'Monalisa',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
          Speaker(
              name: 'Derrick',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
          Speaker(
              name: 'Glenn',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
          Speaker(
              name: 'Gilbert',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
          Speaker(
              name: 'Marian',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
          Speaker(
              name: 'Dave',
              profileImage:
                  "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
              name: 'Sammy',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
          Speaker(
            name: 'Danial',
            profileImage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
          ),
          Speaker(
              name: 'Rubic',
              profileImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
        ],
        eventDescription:
            'The Room for beginners to ask questions and get advice from more experienced forum members.',
        eventDate: 'Today, 6:00 pm',
        ticketAmount: 6),
    EventModal(
      title: 'UNITED PHOTOGRAPHY CAMERA',
      eventName: 'World Camera Day | First Camera',
      coHost: [
        Speaker(
          name: 'Danial',
          profileImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
        ),
        Speaker(
            name: 'Rubic',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
        Speaker(
            name: 'Ailseen',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
        Speaker(
            name: 'Monalisa',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
        Speaker(
            name: 'Derrick',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
        Speaker(
            name: 'Glenn',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
        Speaker(
            name: 'Gilbert',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
        Speaker(
            name: 'Marian',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
        Speaker(
            name: 'Dave',
            profileImage:
                "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
        Speaker(
            name: 'Sammy',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
        Speaker(
          name: 'Danial',
          profileImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
        ),
        Speaker(
            name: 'Rubic',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
        Speaker(
            name: 'Ailseen',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzQBQuIz76W8hvZt8qxOvgCCt0mzKMd0wdzp8w9Jpr0wi1Yx3tbbj49uajKcoGZlfsrgc&usqp=CAU"),
        Speaker(
            name: 'Monalisa',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaxcazjLKPaP2_xIYVKQV2sisCxMw9gCqo8w9NwWc6Y1xfFZfOxXmcCqiDjH2BvvHTNI&usqp=CAU"),
        Speaker(
            name: 'Derrick',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbIhi9l4npCGPNWMAc6szDbxp75kjB3c0R5w&usqp=CAU"),
        Speaker(
            name: 'Glenn',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZZYSsnncqDhroX4Ud9rgHCxpDeyLSN5PdG71BuDAk-ulL4CQCFtjL4lKVH26UIW9EOo&usqp=CAU"),
        Speaker(
            name: 'Gilbert',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuk0iWC7lboODUPc6ZzwMxM04ZwcfxN5MOMg4A97bmQNLBUcsvRBIMkAYuS5tcuCXLGHc&usqp=CAU"),
        Speaker(
            name: 'Marian',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_-fMp-MUmqgRuvC5xpKB7_7-G26NbYOkDAshSW4klCnkkxJ65MQCLx3ZJsUVE0ynbc2Y&usqp=CAU"),
        Speaker(
            name: 'Dave',
            profileImage:
                "https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg"),
        Speaker(
            name: 'Sammy',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
        Speaker(
            name: 'Sammy',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH14u7rKYD9aCAr-qRwTjpnXljCPuy4xbQSkW4HWJtCFReJNpt0-3ZW3MQyiyaIWoYyI&usqp=CAU"),
        Speaker(
          name: 'Danial',
          profileImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
        ),
        Speaker(
            name: 'Rubic',
            profileImage:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRny6M7SVLugIiTJGIYPcr744JSqVf5oPe1Vg&usqp=CAU"),
      ],
      eventDescription:
          'The Room for beginners to ask questions and get advice from more experienced forum members.',
      eventDate: 'Today, 6:00 pm',
      ticketAmount: 12,
    ),
  ];
}
