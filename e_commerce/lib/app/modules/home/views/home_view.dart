import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Home Screen"),
            ElevatedButton(onPressed: (){
             if("Dhaka" == "Dhaka"){
              log("true");
             }else{
              log("false");
             }
            }, child:const Text("Compare"),),
          ],
        ),
      ),
    );
  }
}
