import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/screens/home_screen.dart';
import 'package:ideiacode_cadastro/screens/login_screen.dart';
import 'package:ideiacode_cadastro/services/auth_service.dart';
import 'package:provider/provider.dart';

/// Classe responsável por verificar a autenticação do usuário e redirecionar para a tela adequada.
class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  AuthCheckState createState() => AuthCheckState();
}

class AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }

  /// Exibe um indicador de carregamento enquanto a autenticação está sendo verificada.
  Widget loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
