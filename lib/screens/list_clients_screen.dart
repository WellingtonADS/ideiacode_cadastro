import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';

class ListClientsScreen extends StatelessWidget {
  final List<Cliente> clients;

  const ListClientsScreen({super.key, required this.clients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: clients.isEmpty
          ? const Center(child: Text('Nenhum cliente cadastrado.'))
          : ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ListTile(
                  title: Text(client.nome),
                  subtitle: Text(client.cpf),
                  trailing: Text(client.whatsapp),
                );
              },
            ),
    );
  }
}
