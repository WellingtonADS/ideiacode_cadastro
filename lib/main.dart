import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdeiaCode Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.home,
      routes: Routes.getRoutes(), // Utilizando o método getRoutes() da classe Routes
      locale: const Locale('pt', 'BR'),
    );
  }
}
