import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetException("No internet connection");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
