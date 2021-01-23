import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/modules/login/login_controller.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';
import 'package:mesa_news_app/app/widgets/app_button_widget.dart';
import 'package:mesa_news_app/app/widgets/app_textfiel_widget.dart';

class SignupPage extends StatelessWidget {
  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
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
                        childWidget: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                      ),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                        title: 'E-mail',
                        childWidget: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                      ),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                        title: 'Senha',
                        childWidget: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                      ),
                      SizedBox(height: 20),
                      AppTextFieldWidget(
                        title: 'Confirmar senha',
                        childWidget: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                      ),

                      // NOTE: Omitir data de nascimento : Post Body method not allowed

                      SizedBox(height: 20),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: AppButtonWidget(
                            title: 'Cadastrar',
                            btnColor: mesaColor,
                            fontColor: Colors.white,
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
