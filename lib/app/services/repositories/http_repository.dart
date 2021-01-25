import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/routes/app_routes.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';
import 'package:mesa_news_app/app/widgets/custom_loading_widget.dart';

class AuthRepository {
  final HttpProvider apiProvider;

  AuthRepository({this.apiProvider});

  Future<String> postAuth(String email, password) async {
    try {
      final response = await apiProvider.httpProvider.post(
        '/v1/client/auth/signin',
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) print(response.data);
      Get.back();
      Get.offAndToNamed(AppRoutes.feed);
      apiProvider.httpProvider.options.headers["Authorization"] = "Bearer " + response.data["token"];
      return response.data["token"];
    } on DioError catch (err) {
      BotToast.closeAllLoading();

      print(err.response.data["message"]);
      BotToast.showCustomNotification(
        toastBuilder: (_) => WaitDialog(
          title: 'Ops...',
          message: '${err.response.data["message"]}',
        ),
      );
      rethrow;
    }
  }

  Future<String> postSignup(String user, email, password) async {
    try {
      final response = await apiProvider.httpProvider.post(
        '/v1/client/auth/signup',
        data: {
          "name": user,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) print(response.data);
      BotToast.showCustomNotification(
        toastBuilder: (_) => WaitDialog(
          title: 'Tudo Pronto!',
          message: 'Cadastro Realizado!',
        ),
      );
      return response.data["token"];
    } on DioError catch (err) {
      BotToast.closeAllLoading();

      print(err.response.data["message"]);
      BotToast.showCustomNotification(
        toastBuilder: (_) => WaitDialog(
          title: 'Ops...',
          message: '${err.response?.data["errors"][0]["message"]}',
        ),
      );
      rethrow;
    }
  }
}
