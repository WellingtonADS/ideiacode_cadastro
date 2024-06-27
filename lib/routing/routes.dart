import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';
import 'package:ideiacode_cadastro/screens/client_profile_screen.dart';
import 'package:ideiacode_cadastro/screens/home_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/screens/login_screen.dart';
import 'package:ideiacode_cadastro/screens/main_screen.dart';
import 'package:ideiacode_cadastro/screens/register_screen.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';

class Routes {
  static const String mainScreen = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String homeScreen = '/home';
  static const String listClients = '/listClients';
  static const String addClient = '/addClient';
  static const String clientProfile = '/clientProfile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      mainScreen: (context) => const MainScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      homeScreen: (context) => const HomeScreen(),
      listClients: (context) => const ListClientsScreen(clients: []),
      addClient: (context) => AddClientScreen(
        onAddClient: (Cliente cliente) {
          // Implementação da lógica para adicionar cliente aqui
        },
      ),
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      clientProfile: (context) => ClientProfileScreen(cliente: Cliente(nome: '', cpf: '', dataNascimento: DateTime.now(), whatsapp: '', id: 0), onDelete: (Cliente ) {  }, onUpdate: (Cliente ) {  },),
    };
  }
}
