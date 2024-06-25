// app_styles.dart

import 'package:flutter/material.dart';

class AppStyles {
  static const Color primaryColor = Colors.blue;

  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const AppBarTheme appBarTheme = AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    titleTextStyle: titleTextStyle,
    iconTheme: IconThemeData(color: Colors.white),
  );

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    minimumSize: const Size(200, 50),
  );
}
