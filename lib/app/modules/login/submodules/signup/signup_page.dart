import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';
import 'package:mesa_news_app/app/services/providers/no_connection.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';
import 'package:mesa_news_app/app/widgets/app_button_widget.dart';
import 'package:mesa_news_app/app/widgets/app_textfiel_widget.dart';

class SignupPage extends StatelessWidget {
  final LoginController controller = Get.find();

  final FocusNode _toEmailNode = new FocusNode();
  final FocusNode _toPassNode = new FocusNode();
  final FocusNode _toConfirmPassNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    NConnection.checkConnection();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.close)),
        brightness: Brightness.dark,
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Form(
                    key: controller.formKeySignup.value,
                    child: Column(children: [
                      AppTextFieldWidget(
                          title: 'Nome',
                          childWidget: TextFormField(
                              controller: controller.userController,
                              onEditingComplete: () => FocusScope.of(context).requestFocus(_toEmailNode),
                              decoration: InputDecoration(border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo necessário';
                                } else {
                                  return null;
                                }
                              })),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                          title: 'E-mail',
                          childWidget: TextFormField(
                              focusNode: _toEmailNode,
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              onEditingComplete: () => FocusScope.of(context).requestFocus(_toPassNode),
                              decoration: InputDecoration(border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo necessário';
                                } else if (!value.contains('@')) {
                                  return 'Preencha com um e-mail válido';
                                } else {
                                  return null;
                                }
                              })),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                          title: 'Senha',
                          childWidget: TextFormField(
                              obscureText: true,
                              focusNode: _toPassNode,
                              controller: controller.passController,
                              onEditingComplete: () => FocusScope.of(context).requestFocus(_toConfirmPassNode),
                              decoration: InputDecoration(border: InputBorder.none),
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
                              })),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                          title: 'Confirmar senha',
                          childWidget: TextFormField(
                            obscureText: true,
                            focusNode: _toConfirmPassNode,
                            controller: controller.confirmPassController,
                            decoration: InputDecoration(border: InputBorder.none),
                            validator: (value) {
                              if (value != controller.passController.text) {
                                return 'As senhas devem ser as mesmas';
                              } else {
                                return null;
                              }
                            },
                          )),

                      // NOTE: Omitir data de nascimento : Post Body method not allowed

                      SizedBox(height: 20),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: AppButtonWidget(
                            title: 'Cadastrar',
                            btnColor: mesaColor,
                            fontColor: Colors.white,
                            onTap: () {
                              final result = controller.formKeySignup.value.currentState.validate();
                              print(result);
                              if (result) {
                                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                                controller.postSignup();
                              }
                            },
                          )),
                      SizedBox(height: 20),
                    ])),
                SizedBox(height: Get.height * .075),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
