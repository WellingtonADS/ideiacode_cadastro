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
        title: const Text('Criar Conta'),        
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: AppStyles.subtitleTextStyle,
                  ),
                  // Você pode adicionar validação para o campo de nome, se necessário
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: AppStyles.subtitleTextStyle,
                    errorText: _emailErrorText,
                  ),
                  onChanged: _validateEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um e-mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: AppStyles.subtitleTextStyle,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha';
                    }
                    return null;
                  },
                  // Você pode adicionar onChanged para validar a senha, se necessário
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
                  // Utilizando o estilo de botão do app_styles.dart
                  child: const Text(
                    'Criar Conta',
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
