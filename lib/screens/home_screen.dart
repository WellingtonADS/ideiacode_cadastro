import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/screens/add_client_screen.dart';
import 'package:ideiacode_cadastro/screens/list_clients_screen.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';

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
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
              ElevatedButton(
                onPressed: _navigateToAddClient, // Navega para a tela de adicionar cliente
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: const Size(200, 50),
                ),
                child: const Text(
                  'Adicionar Cliente',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToListClients, // Navega para a tela de listar clientes
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: const Size(200, 50),
                ),
                child: const Text(
                  'Listar Clientes',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
