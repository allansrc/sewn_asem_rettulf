import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';
import 'package:mesa_news_app/app/widgets/custom_loading_widget.dart';

class AuthRepository {
  final AuthProvider apiProvider;

  AuthRepository({this.apiProvider});

  Future<String> postAuth(String email, password) async {
    try {
      final response = await apiProvider.httpProvider.post(
        '/v1/client/auth/signin',
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) print(response.data);
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
}
