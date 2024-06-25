import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/Styles/app_styles.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: AppStyles.subtitleTextStyle,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: AppStyles.subtitleTextStyle,),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: AppStyles.subtitleTextStyle,),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para registrar
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
              },
              style: AppStyles.elevatedButtonStyle,
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}
