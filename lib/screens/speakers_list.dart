import 'package:club_92/utils/const.dart';
import 'package:flutter/material.dart';

class SpeakersList extends StatelessWidget {
  const SpeakersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    mainAxisSpacing:
                        40.0, // Space between items along the main axis
                    crossAxisSpacing:
                        10.0, // Space between items along the cross axis
                    childAspectRatio: 1 // Aspect ratio of each item
                    ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // Replace the following container with your custom widget for each grid item
                    return Column(
                      children: [
                        CircleAvatar(
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    );
                  },
                  childCount: 20, // Number of items in the grid
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
