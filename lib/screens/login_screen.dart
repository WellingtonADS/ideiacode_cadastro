import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';
import 'package:ideiacode_cadastro/routing/routes.dart'; // Importando as rotas

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: AppStyles.titleTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle: AppStyles.subtitleTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: AppStyles.subtitleTextStyle,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.homeScreen); // Navegando para a HomeScreen após o login
              },
              style: AppStyles.elevatedButtonStyle,
              child: const Text(
                'Entrar',
                style: AppStyles.buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
