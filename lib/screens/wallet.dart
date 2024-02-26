import 'package:club_92/components/reusableWidgets/custom_button.dart';
import 'package:club_92/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final WalletController controller = Get.put(
    WalletController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WALLET'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available amount in wallet',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('\$ ${controller.walletData.balance}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 30)),
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
                color: Theme.of(context).colorScheme.surface,
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
                          ),
                        ),
                        Baseline(
                          baseline: 5,
                          baselineType: TextBaseline.alphabetic,
                          child: CustomMaterialButton(
                            onPress: () {},
                            child: Text(
                              'Add Money',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
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
                        itemCount:
                            controller.walletData.transactions?.length ?? 0,
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
                                      text: TextSpan(
                                        text: 'Joined on',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        children: [
                                          TextSpan(
                                            text: ' 20 June,10.00 pm',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 270,
                                      child: Text(
                                        controller.walletData
                                            .transactions![index].roomName,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  '\$${controller.walletData.transactions![index].joiningAmount}',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 0.5,
                              color: Theme.of(context).colorScheme.background,
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
