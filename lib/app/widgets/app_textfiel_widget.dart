import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String title;
  final Widget childWidget;

  const AppTextFieldWidget({Key key, this.title, @required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(title ?? ''),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: childWidget,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            )),
      ],
    );
  }
}
