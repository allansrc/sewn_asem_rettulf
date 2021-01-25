import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mesa_news_app/app/services/repositories/http_repository.dart';
import 'package:mesa_news_app/app/widgets/custom_loading_widget.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;

  LoginController(this._repository);

// NOTE: Login/Signin
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final Rx<GlobalKey<FormState>> formKeySignin = GlobalKey<FormState>().obs;

// NOTE: Login/Signup
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final Rx<GlobalKey<FormState>> formKeySignup = GlobalKey<FormState>().obs;

  final storage = GetStorage();
  final RxString userToken = ''.obs;
  postLogin() async {
    _postLoginDiag();
    final resultToken = await _repository.postAuth(emailTextController.text, passwordTextController.text);
    userToken.value = resultToken;
    storage.write('token', resultToken);
  }

  postSignup() async {
    _postSignupDiag();
    final resultToken = await _repository.postSignup(
      userController.text,
      emailController.text,
      passController.text,
    );
    userToken.value = resultToken;
    storage.write('token', resultToken);
    BotToast.closeAllLoading();
    print('Done');
  }

  _postLoginDiag() => BotToast.showCustomLoading(
      ignoreContentClick: true,
      toastBuilder: (_) => WaitDialog(
            title: 'Aguarde...',
            message: 'Efetuando login',
          ));
  _postSignupDiag() => BotToast.showCustomLoading(
      ignoreContentClick: true,
      toastBuilder: (_) => WaitDialog(
            title: 'Aguarde...',
            message: 'Efetuando Cadastro',
          ));
}
