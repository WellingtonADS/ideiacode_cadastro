import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

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
          ? const Center(child: Text('Nenhum cliente cadastrado.', style: AppStyles.subtitleTextStyle)) // Aplicando estilo de texto para mensagem
          : ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ListTile(
                  title: Text(
                    client.nome,
                    style: AppStyles.subtitleTextStyle, // Aplicando estilo de texto para o título do ListTile
                  ),
                  subtitle: Text(
                    client.cpf,
                    style: AppStyles.subtitleTextStyle, // Aplicando estilo de texto para o subtítulo do ListTile
                  ),
                  trailing: Text(
                    client.whatsapp,
                    style: AppStyles.subtitleTextStyle, // Aplicando estilo de texto para o texto à direita do ListTile
                  ),
                );
              },
            ),
    );
  }
}
