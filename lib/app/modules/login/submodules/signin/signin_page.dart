import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/routes/app_routes.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';
import 'package:mesa_news_app/app/widgets/app_button_widget.dart';
import 'package:mesa_news_app/app/widgets/app_textfiel_widget.dart';

import '../../login_controller.dart';

class SigninPage extends GetView<LoginController> {
  final FocusNode _toPassNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close)),
        brightness: Brightness.dark,
      ),
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: Image.asset('assets/images/signin.png')),
                ),
                Form(
                    key: controller.formKeySignin.value,
                    child: Column(children: [
                      AppTextFieldWidget(
                          title: 'E-mail',
                          childWidget: TextFormField(
                              controller: controller.userTextController,
                              onEditingComplete: () => FocusScope.of(context).requestFocus(_toPassNode),
                              decoration: InputDecoration(border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo necessário';
                                } else if (!value.contains('')) {
                                  return 'Preencha com um e-mail válido';
                                } else {
                                  return null;
                                }
                              })),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                        title: 'Senha',
                        childWidget: TextFormField(
                            focusNode: _toPassNode,
                            controller: controller.passwordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo necessário';
                              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                                return 'A senha deve conter ao menos uma letra Maiúscula';
                              } else if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'A senha deve conter ao menos um número';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(height: 20),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: AppButtonWidget(
                            title: 'Login',
                            btnColor: mesaColor,
                            fontColor: Colors.white,
                            onTap: () {
                              final result = controller.formKeySignin.value.currentState.validate();
                              print(result);
                              if (result) {
                                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                                controller.getLogin();
                              }
                            },
                          )),
                      SizedBox(height: 20),
                    ])),
                SizedBox(height: Get.height * .075),
                bottomOptionsAction(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomOptionsAction() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          AppButtonWidget(
            title: 'Entrar com Facebook',
            onTap: () => print('facebook'),
            borderColor: mesaColor,
            fontColor: mesaColor,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Não tenho conta. ',
                style: TextStyle(color: mesaColor),
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.signup),
                child: Text(
                  'Cadastrar. ',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
