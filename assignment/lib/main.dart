import 'package:assignment/routes/rouenames.dart';
import 'package:assignment/routes/routeconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(iconTheme: const IconThemeData(color: Colors.white)),
      initialRoute: AppRouteNams.loginScreen, 
      getPages: AppRouteConfiguration.routes,
    );
  }
}