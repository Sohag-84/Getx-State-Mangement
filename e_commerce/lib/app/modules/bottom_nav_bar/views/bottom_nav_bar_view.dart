import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavBarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BottomNavBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
