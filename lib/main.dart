import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/screens/main_screen.dart';

void main() {
  runApp(const Cadastro());
}

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdeiaCode Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(), // Definindo MainScreen como tela inicial
      locale: const Locale('pt', 'BR'),
    );
  }
}
