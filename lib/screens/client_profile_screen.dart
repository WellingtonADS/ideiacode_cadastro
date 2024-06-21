import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/screens/edit_client_screen.dart';

class ClientProfileScreen extends StatefulWidget {
  final Cliente cliente;
  final Function(Cliente) onDelete;
  final Function(Cliente) onUpdate;

  const ClientProfileScreen({
    super.key,
    required this.cliente,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  ClientProfileScreenState createState() => ClientProfileScreenState();
}

class ClientProfileScreenState extends State<ClientProfileScreen> {
  late Cliente _cliente;

  @override
  void initState() {
    super.initState();
    _cliente = widget.cliente;
  }

  void _updateClient(Cliente updatedClient) {
    setState(() {
      _cliente = updatedClient;
    });
    widget.onUpdate(updatedClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Cliente'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditClientScreen(
                    cliente: _cliente,
                    onSave: _updateClient,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${_cliente.nome}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'CPF: ${_cliente.cpf}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            // Adicione aqui mais informações do cliente conforme necessário
          ],
        ),
      ),
    );
  }
}
