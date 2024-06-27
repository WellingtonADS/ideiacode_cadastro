import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
<<<<<<< HEAD
import 'package:ideiacode_cadastro/styles/app_styles.dart';
=======
>>>>>>> bc7606f7cbb277def82b98024c6c32f4e851e90d

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
<<<<<<< HEAD
      //initialRoute: Routes.mainScreen,
      routes: Routes.getRoutes(),
=======
      initialRoute: Routes.home,
      routes: Routes.getRoutes(), // Utilizando o método getRoutes() da classe Routes
>>>>>>> bc7606f7cbb277def82b98024c6c32f4e851e90d
      locale: const Locale('pt', 'BR'),
    );
  }
}
