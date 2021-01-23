import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';
import 'package:mesa_news_app/app/services/repositories/auth_repository.dart';

import 'login_controller.dart';

class LoginDI implements Bindings {
  @override
  void dependencies() {
    Get.put(
      Dio(BaseOptions(baseUrl: 'https://mesa-news-api.herokuapp.com/')),
      permanent: true,
    );
    Get.put(
      LoginController(
        AuthRepository(
          apiProvider: AuthProvider(
            Get.find(),
          ),
        ),
      ),
      permanent: true,
    );
  }
}
