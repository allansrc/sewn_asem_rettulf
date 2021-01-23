import 'package:flutter/material.dart';

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(63, 182, 167, .1),
  100: Color.fromRGBO(63, 182, 167, .2),
  200: Color.fromRGBO(63, 182, 167, .3),
  300: Color.fromRGBO(63, 182, 167, .4),
  400: Color.fromRGBO(63, 182, 167, .5),
  500: Color.fromRGBO(63, 182, 167, .6),
  600: Color.fromRGBO(63, 182, 167, .7),
  700: Color.fromRGBO(63, 182, 167, .8),
  800: Color.fromRGBO(63, 182, 167, .9),
  900: Color.fromRGBO(63, 182, 167, 1),
};

MaterialColor mesaColor = MaterialColor(0xff010A53, colorCodes);

final ThemeData appThemeData = ThemeData(
  primarySwatch: mesaColor,
  brightness: Brightness.light,
  accentColor: Colors.blue[900],
  appBarTheme: AppBarTheme(color: mesaColor),
);
