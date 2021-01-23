import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mesa_news_app/app/services/repositories/auth_repository.dart';
import 'package:mesa_news_app/app/widgets/custom_loading_widget.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;

  LoginController(this._repository);

  final TextEditingController userTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final Rx<GlobalKey<FormState>> formKeySignin = GlobalKey<FormState>().obs;
  final Rx<GlobalKey<FormState>> formKeySignup = GlobalKey<FormState>().obs;
  final storage = GetStorage();
  final RxString userToken = ''.obs;
  postLogin() async {
    BotToast.showCustomLoading(
      toastBuilder: (_) => WaitDialog(title: 'Aguarde...', message: 'Efetuando login'),
      ignoreContentClick: true,
    );

    final resultToken = await _repository.postAuth(userTextController.text, passwordTextController.text);

    userToken.value = resultToken;
    storage.write('token', resultToken);

    BotToast.closeAllLoading();
  }

  getLogin() async {
    BotToast.showCustomLoading(
      toastBuilder: (_) => WaitDialog(title: 'Aguarde...', message: 'Efetuando login'),
      ignoreContentClick: true,
    );

    final resultToken = await _repository.postAuth(userTextController.text, passwordTextController.text);

    userToken.value = resultToken;
    storage.write('token', resultToken);

    BotToast.closeAllLoading();
  }
}
