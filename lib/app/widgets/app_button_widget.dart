import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Color fontColor;
  final Color btnColor;
  final GestureTapCallback onTap;

  const AppButtonWidget({Key key, this.title, this.fontColor, this.btnColor, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: 48,
        width: Get.width,
        decoration: BoxDecoration(
          color: btnColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: fontColor ?? Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
