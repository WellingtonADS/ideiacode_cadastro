import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/screens/login_screen.dart';
import 'package:ideiacode_cadastro/screens/register_screen.dart';
import 'package:ideiacode_cadastro/screens/home_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String homeScreen = '/home';
  static const String listClients = '/listClients';
  static const String addClient = '/addClient';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      homeScreen: (context) => const HomeScreen(),
      listClients: (context) => const ListClientsScreen(clients: []),
      addClient: (context) => AddClientScreen(
        onAddClient: (cliente) {
          // Implementação da lógica para adicionar cliente
        },
      ),
    };
  }
}
