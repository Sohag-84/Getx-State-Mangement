import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/localization/languages.dart';
import 'package:getx_mvvm_architecture/res/routes/colors/app_colors.dart';
import 'package:getx_mvvm_architecture/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter MVVM Architecture',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
