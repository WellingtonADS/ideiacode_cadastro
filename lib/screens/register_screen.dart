import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
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
        title: const Text('Criar Conta', style: AppStyles.titleTextStyle),
      ),
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: AppStyles.subtitleTextStyle,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: AppStyles.subtitleTextStyle,
                    errorText: _emailErrorText,
                  ),
                  onChanged: _validateEmail,
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
                    if (_formKey.currentState!.validate() && _emailErrorText == null) {
                      // Lógica para registrar
                      Navigator.pushReplacementNamed(context, Routes.homeScreen);
                    }
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
        ),
      ),
    );
  }
}
