import 'package:flutter/material.dart';

import '../constants/appcolors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    fontFamily: regular,
    appBarTheme: AppBarTheme(
      // elevation: 0,
      backgroundColor: blueGrey,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 14,
      ),
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}
