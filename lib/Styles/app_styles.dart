import 'package:flutter/material.dart';

class AppStyles {
  // Cores principais
  static const Color primaryColor = Colors.blue;

  // Estilo de texto para títulos
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Cor dos títulos
  );

  // Estilo de texto para subtítulos
  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Colors.black87, // Cor dos subtítulos
  );

  // Estilo de texto para rótulos de campos de entrada
  static const TextStyle inputLabelTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black54, // Cor dos rótulos dos campos de entrada
  );

  // Estilo de texto para cabeçalhos
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Cor dos cabeçalhos
  );

  // Estilo de texto para o corpo do texto principal
  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87, // Cor do corpo do texto principal
  );

  // Estilo da AppBar
  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  // Estilo de botão elevado
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  // Estilo de texto para botões
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white, // Cor do texto dos botões
  );
}
