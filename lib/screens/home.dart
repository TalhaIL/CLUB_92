import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Card(
            color: textFieldColor.withOpacity(0.07),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'App UI Design',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.flag,
                            color: greenColor,
                            size: 17,
                          )
                        ],
                      ),
                      Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            const Center(
                              child: Text(
                                '\$9',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'BASICS OF USER INTERFACE DESIGN',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 45,
                                  child: Container(
                                    height: 60,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 95,
                                  child: Container(
                                    height: 60,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.hearing,
                                size: 13,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Icon(
                                Icons.person_outline_rounded,
                                size: 13,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Daniel',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                          Text(
                            'Daniel',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                'Daniel',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.mic,
                                size: 15,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Text(
                            'Daniel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
