import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            return Text(
              "${controller.count}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              controller.increment();
            },
            child: const Text("Increment"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                "/bottom-nav-bar",
                arguments: {
                  "counterValue": 12,
                  "name": "Ih Sohag",
                },
              );
            },
            child: const Text("Go Next page>>"),
          ),
        ],
      ),
    );
  }
}
