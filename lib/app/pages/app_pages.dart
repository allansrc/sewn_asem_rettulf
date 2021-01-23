import 'package:get/get.dart';
import 'package:mesa_news_app/app/modules/feed/feed_di.dart';
import 'package:mesa_news_app/app/modules/feed/feed_page.dart';
import 'package:mesa_news_app/app/modules/login/login_di.dart';
import 'package:mesa_news_app/app/modules/login/login_page.dart';
import 'package:mesa_news_app/app/modules/login/submodules/signin/signin_page.dart';
import 'package:mesa_news_app/app/modules/login/submodules/signup/signup_page.dart';
import 'package:mesa_news_app/app/routes/app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => LoginPage(),
      binding: LoginDI(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => SigninPage(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupPage(),
    ),
    GetPage(
      name: AppRoutes.feed,
      page: () => FeedPage(),
      binding: FeedDI(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => LoginPage(),
    ),
  ];
}
