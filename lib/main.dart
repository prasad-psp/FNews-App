import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_mvvm/core/routes/app_routes.dart';
import 'package:news_app_mvvm/res/app_theme.dart';
import 'package:news_app_mvvm/ui/home_page/home_view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const FNewsApp());
}

class FNewsApp extends StatelessWidget {
  const FNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FNews app",
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
      theme: AppTheme.theme,
    );
  }
}
