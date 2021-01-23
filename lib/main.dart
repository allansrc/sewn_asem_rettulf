import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mesa_news_app/app/pages/app_pages.dart';
import 'package:mesa_news_app/app/routes/app_routes.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MESA NEWS',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      theme: appThemeData,
    );
  }
}
