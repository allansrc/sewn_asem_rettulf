import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';
import 'package:mesa_news_app/app/services/repositories/http_repository.dart';

import 'login_controller.dart';

class LoginDI implements Bindings {
  @override
  void dependencies() {
    Get.put(
      Dio(BaseOptions(baseUrl: 'https://mesa-news-api.herokuapp.com/')),
      permanent: true,
    );
    // Get.lazyPut(()=>
    Get.put(
      LoginController(
        AuthRepository(
          apiProvider: HttpProvider(
            Get.find(),
          ),
        ),
      ),
      permanent: true,
    );
  }
}
