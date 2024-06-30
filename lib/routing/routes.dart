/// Este arquivo contém a definição de todas as rotas usadas na aplicação.
/// Cada rota está associada a uma tela/widget específico.
/// A classe [Routes] fornece um método estático [getRoutes] que retorna um mapa de rotas e seus construtores de widgets correspondentes.
/// As rotas incluem:
/// - [authCheck]: A rota inicial que verifica o status de autenticação do usuário.
/// - [login]: A rota para a tela de login.
/// - [homeScreen]: A rota para a tela inicial.
/// - [listClients]: A rota para a tela de listagem de clientes.
/// - [addClient]: A rota para a tela de adicionar cliente.
/// - [clientProfile]: A rota para a tela de perfil do cliente.
/// Cada rota está associada a uma função construtora de widget que retorna a tela/widget correspondente.
/// As funções construtoras de widget são definidas como funções anônimas que recebem um [BuildContext] como parâmetro e retornam a tela/widget correspondente.
/// As telas/widgets [AuthCheck], [LoginScreen], [HomeScreen], [ListClientsScreen], [AddClientScreen] e [ClientProfileScreen] estão associadas às rotas.
/// As telas [AddClientScreen] e [ClientProfileScreen] possuem parâmetros adicionais para lidar com dados do cliente e realizar ações como adicionar, excluir e atualizar clientes.
library;
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

  /// Retorna um mapa de rotas e seus construtores de widgets correspondentes.
  /// Cada rota está associada a uma função construtora de widget que retorna a tela/widget correspondente.
  /// As funções construtoras de widget são definidas como funções anônimas que recebem um [BuildContext] como parâmetro e retornam a tela/widget correspondente.
  /// As telas/widgets [AuthCheck], [LoginScreen], [HomeScreen], [ListClientsScreen], [AddClientScreen] e [ClientProfileScreen] estão associadas às rotas.
  /// As telas [AddClientScreen] e [ClientProfileScreen] possuem parâmetros adicionais para lidar com dados do cliente e realizar ações como adicionar, excluir e atualizar clientes.
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
