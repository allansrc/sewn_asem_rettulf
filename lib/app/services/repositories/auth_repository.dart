import 'package:dio/dio.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';

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
      print(err.response.data);
      rethrow;
    }
  }
}
