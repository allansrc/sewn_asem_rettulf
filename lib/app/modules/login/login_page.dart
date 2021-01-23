import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';
import 'package:mesa_news_app/app/widgets/app_button_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(brightness: Brightness.dark),
      backgroundColor: mesaColor,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            centerLogoWidget(),
            bottomActions(),
          ],
        ),
      ),
    );
  }

  Widget centerLogoWidget() {
    return Container(
      height: Get.height * .4,
      child: Column(
        children: [
          Center(
              child: Container(
            child: Image.asset('assets/images/logo.png'),
          )),
          SizedBox(height: 16),
          Center(
              child: Container(
            child: Image.asset('assets/images/NEWS.png'),
          )),
        ],
      ),
    );
  }

  Widget bottomActions() {
    return Container(
      child: Column(
        children: [
          AppButtonWidget(
            title: 'Entrar com Facebook',
            onTap: () => print('facebook'),
          ),
          SizedBox(height: 16),
          AppButtonWidget(
            title: 'Entrar com e-mail',
            fontColor: Colors.white,
            btnColor: mesaColor,
            onTap: () => print('e-mail'),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tenho conta. ',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () => print('Cadastrar'),
                  child: Text(
                    'Cadastrar. ',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
