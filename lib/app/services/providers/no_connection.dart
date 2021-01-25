import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news_app/app/widgets/custom_loading_widget.dart';

class NConnection {
  static checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      await _checkInternetConnection();
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      await _checkInternetConnection();
      return true;
    }
    await _checkInternetConnection();
    return false;
  }

  static _checkInternetConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY!');
      return true;
    } else {
      print('No internet :(');
      print(DataConnectionChecker().lastTryResults);
      BotToast.showCustomNotification(
        duration: Duration(seconds: 4),
        toastBuilder: (_) {
          return WaitDialog(
            title: 'Ops...',
            message: ' Sua conexão não tem acesso à internet! ',
            textColor: Colors.red[600],
          );
        },
      );
      return false;
    }
  }

  static checkInternetConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY!');
      BotToast.showCustomNotification(
        toastBuilder: (_) {
          return WaitDialog(
            title: 'YAY!',
            message: ' Connectado à internet! ',
          );
        },
      );
      return true;
    } else {
      print('No internet :(');
      print(DataConnectionChecker().lastTryResults);
      BotToast.showCustomNotification(
        toastBuilder: (_) {
          return WaitDialog(
            title: 'Tente novamente',
            message: ' Você não tem acesso à internet! ',
            textColor: Colors.red[600],
          );
        },
      );
      return false;
    }
  }
}
