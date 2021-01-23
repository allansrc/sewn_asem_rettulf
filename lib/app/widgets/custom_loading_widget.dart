import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news_app/app/themes/app_theme.dart';

class WaitDialog extends StatelessWidget {
  final String title;
  final String message;
  final Color textColor;

  const WaitDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(4),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(title ?? '',
                style: TextStyle(
                  color: textColor ?? mesaColor,
                  fontWeight: FontWeight.w500,
                )),
            Text(message ?? '',
                style: TextStyle(
                  color: textColor ?? mesaColor,
                  fontWeight: FontWeight.w500,
                )),
          ]),
          constraints: BoxConstraints(
            minWidth: Get.width * .5,
            maxWidth: Get.width * .8,
            minHeight: Get.height * .07,
            maxHeight: Get.height * .15,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey)])),
    );
  }
}
