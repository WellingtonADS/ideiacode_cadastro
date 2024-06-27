import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sistema de Cadastro',
          style: AppStyles.titleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: AppStyles.primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/LOGO_IDEIACODE.png',
              width: 300,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo a IdeiaCode!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cadastre-se para começar',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              style: AppStyles.elevatedButtonStyle,
              child: const Text(
                'Login',
                style: AppStyles.buttonTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              style: AppStyles.elevatedButtonStyle,
              child: const Text(
                'Criar Conta',
                style: AppStyles.buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
