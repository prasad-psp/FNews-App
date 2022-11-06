import 'package:get/get.dart';
import 'package:news_app_mvvm/model/news_model.dart';
import 'package:news_app_mvvm/ui/home_page/home_view.dart';
import 'package:news_app_mvvm/ui/news_detail_page/news_detail_view.dart';

class AppRoutes {
  static const String _initialRoute = "/home";
  static const String _newsDetailRoute = "/news_detail";

  static String get initialRoute => _initialRoute;

  static String get newsDetailRoute => _newsDetailRoute;

  static List<GetPage> routes = [
    GetPage(
      name: _initialRoute,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _newsDetailRoute,
      page: () => NewsDetailView(news: Get.arguments),
      arguments: Datum,
    )
  ];
}
