import 'package:chat_app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp(
    this.isAuth, {
    super.key,
  });

  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: isAuth ? AppPages.HOME : AppPages.CHAT,
      getPages: AppPages.routes,
    );
  }
}
