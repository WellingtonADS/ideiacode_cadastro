import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/routing/routes.dart';


class ListClientsScreen extends StatelessWidget {
  final List<Cliente> clients;

  const ListClientsScreen({super.key, required this.clients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: clients.isEmpty
          ? const Center(
              child: Text(
                'Nenhum cliente cadastrado.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text(
                      client.nome,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      client.cpf,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.clientProfile,
                        arguments: client,
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
