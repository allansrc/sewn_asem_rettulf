import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login_controller.dart';

class SigninPage extends GetView<LoginController> {
  // final LoginController loginController = Get.find();
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
