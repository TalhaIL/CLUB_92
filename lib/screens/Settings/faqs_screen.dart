import 'package:club_92/core/constants/faq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqsScreen extends StatelessWidget {
  static const String route = 'faq-screen';
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ\'s'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView.builder(
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  faqs[index].isVisible.value = !faqs[index].isVisible.value;
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${faqs[index].question} ?",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: faqs[index].isVisible.value,
                  child: Text(
                    faqs[index].answer,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          itemCount: faqs.length,
        ),
      ),
    );
  }
}
