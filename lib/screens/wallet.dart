import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/constants/color.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('WALLET'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available amount in wallet',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ 58.00',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: textFieldColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Baseline(
                          baseline: 30,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            'Recent Transactions',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Baseline(
                          baseline: 5,
                          baselineType: TextBaseline.alphabetic,
                          child: CustomMaterialButton(
                            onPress: () {},
                            text: 'ADD MONEY',
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Joined on',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ' 20 June,10.00 pm',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 270,
                                      child: Text(
                                        'Basics of user interface ',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  '\$20',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              height: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
