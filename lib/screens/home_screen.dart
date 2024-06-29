import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Cliente> _clients = []; // Lista de clientes

  void _addClient(Cliente client) {
    setState(() {
      _clients.add(client); // Adiciona um cliente à lista
    });
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, Routes.login); // Navega para a tela de login
  }

  void _navigateToAddClient() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddClientScreen(onAddClient: _addClient), // Navega para a tela de adicionar cliente
      ),
    );
  }

  void _navigateToListClients() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListClientsScreen(clients: _clients), // Navega para a tela de listar clientes
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'), // Título da barra de navegação
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Função para fazer logout
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                          Image.asset(
              'assets/images/LOGO_IDEIACODE.png',
              width: 300,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo a IdeiaCode!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _navigateToAddClient, // Navega para a tela de adicionar cliente
                style: AppStyles.elevatedButtonStyle, // Aplica o estilo de botão definido em AppStyles
                child: const Text(
                  'Adicionar Cliente',
                  style: AppStyles.buttonTextStyle, // Aplica o estilo de texto definido em AppStyles
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToListClients, // Navega para a tela de listar clientes
                style: AppStyles.elevatedButtonStyle, // Aplica o estilo de botão definido em AppStyles
                child: const Text(
                  'Listar Clientes',
                  style: AppStyles.buttonTextStyle, // Aplica o estilo de texto definido em AppStyles
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
