import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _emailErrorText;

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailErrorText = 'Por favor, insira um e-mail';
      } else if (!value.contains('@')) {
        _emailErrorText = 'Formato de e-mail inválido';
      } else {
        _emailErrorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        // Utilizando o estilo de texto do app_styles.dart para o título da AppBar
      ),
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: AppStyles.subtitleTextStyle,
                    errorText: _emailErrorText,
                  ),
                  onChanged: _validateEmail,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 600,
                  child: TextField(
                    key: Key('passwordField'),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: AppStyles.subtitleTextStyle,
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.homeScreen);
                  },
                  style: AppStyles.elevatedButtonStyle,
                  // Utilizando o estilo de botão do app_styles.dart
                  child: const Text(
                    'Login',
                    style: AppStyles.buttonTextStyle,
                    // Utilizando o estilo de texto do botão do app_styles.dart
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
