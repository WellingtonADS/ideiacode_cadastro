import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

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
        appBarTheme: AppStyles.appBarTheme,
      ),
      //initialRoute: Routes.mainScreen,
      routes: Routes.getRoutes(),
      locale: const Locale('pt', 'BR'),
    );
  }
}
