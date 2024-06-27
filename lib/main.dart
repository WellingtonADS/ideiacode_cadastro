import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/Styles/app_styles.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';

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
        primaryColor: AppStyles.primaryColor,
        appBarTheme: AppStyles.appBarTheme, // Aplicando o tema da AppBar globalmente

      ),
      initialRoute: Routes.mainScreen,
      routes: Routes.getRoutes(),
    );
  }
}
