import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/screens/client_profile_screen.dart';
import 'package:ideiacode_cadastro/screens/login_screen.dart';
import 'package:ideiacode_cadastro/screens/main_screen.dart';
import 'package:ideiacode_cadastro/screens/register_screen.dart';
import 'package:ideiacode_cadastro/screens/home_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';
import 'package:ideiacode_cadastro/screens/main_screen.dart';
import 'package:flutter/widgets.dart ';

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
<<<<<<< HEAD
      
      mainScreen: (context) => const MainScreen(),
=======
      home: (context) => const MainScreen(),
>>>>>>> bc7606f7cbb277def82b98024c6c32f4e851e90d
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      homeScreen: (context) => const HomeScreen(),
      listClients: (context) => const ListClientsScreen(clients: []),
      addClient: (context) => AddClientScreen(
        onAddClient: (cliente) {
          // Implementação da lógica para adicionar cliente
        },
      ),
      clientProfile: (context) {
        final args = ModalRoute.of(context)?.settings.arguments;
        if (args is Cliente) {
          return ClientProfileScreen(
            cliente: args,
            onDelete: (cliente) {
              // Lógica para deletar cliente
            },
            onUpdate: (cliente) {
              // Lógica para atualizar cliente
            },
          );
        } else {
          // Trate o caso em que o argumento não é do tipo Cliente
          // Isso pode incluir navegar de volta para a tela anterior ou exibir uma mensagem de erro.
          return Scaffold(
            appBar: AppBar(
              title: const Text('Erro'),
            ),
            body: const Center(
              child: Text('Erro ao carregar perfil do cliente.'),
            ),
          );
        }
      },
    };
  }
}
