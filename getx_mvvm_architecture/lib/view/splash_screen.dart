import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/data/app_exceptions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "email_hint".tr,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetException("No internet connection");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
