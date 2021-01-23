import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';

final LoginController loginController = Get.find();

// final InicioController controller = Get.put(InicioController(
//     UserRepository(UserProvider(httpClient: Get.find())), EventRepository(EventProvider(httpClient: Get.find()))));
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close)),
        brightness: Brightness.dark,
      ),
    );
  }
}
