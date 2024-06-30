import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';
import 'package:ideiacode_cadastro/screens/client_profile_screen.dart';
import 'package:ideiacode_cadastro/screens/home_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/screens/login_screen.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/services/auth_check.dart';

class Routes {
  static const String authCheck = '/'; // Rota inicial
  static const String login = '/login';
  static const String homeScreen = '/home';
  static const String listClients = '/listClients';
  static const String addClient = '/addClient';
  static const String clientProfile = '/clientProfile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      authCheck: (context) => const AuthCheck(), // Definindo AuthCheck como rota inicial
      login: (context) => const LoginScreen(),
      homeScreen: (context) => const HomeScreen(),
      listClients: (context) => const ListClientsScreen(clients: []),
      addClient: (context) => AddClientScreen(
        onAddClient: (Cliente cliente) {
          // Implementação da lógica para adicionar cliente aqui
        },
      ),
      clientProfile: (context) => ClientProfileScreen(
        cliente: Cliente(
          nome: '',
          cpf: '',
          dataNascimento: DateTime.now(),
          whatsapp: '',
          id: 0,
        ),
        onDelete: (Cliente cliente) {
          // Implementação da lógica para deletar cliente aqui
        },
        onUpdate: (Cliente cliente) {
          // Implementação da lógica para atualizar cliente aqui
        },
      ),
    };
  }
}
