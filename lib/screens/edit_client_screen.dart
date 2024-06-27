import 'package:flutter/material.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';

class EditClientScreen extends StatefulWidget {
  final Cliente cliente;
  final Function(Cliente) onSave;

  const EditClientScreen({super.key, required this.cliente, required this.onSave});

  @override
  EditClientScreenState createState() => EditClientScreenState();
}

class EditClientScreenState extends State<EditClientScreen> {
  late TextEditingController _nameController;
  late TextEditingController _cpfController;
  late TextEditingController _dobController;
  late TextEditingController _whatsappController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.cliente.nome);
    _cpfController = TextEditingController(text: widget.cliente.cpf);
    _dobController = TextEditingController(text: widget.cliente.dataNascimento.toString());
    _whatsappController = TextEditingController(text: widget.cliente.whatsapp);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cpfController.dispose();
    _dobController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  void _save() {
    final updatedClient = Cliente(
      id: widget.cliente.id,
      nome: _nameController.text,
      cpf: _cpfController.text,
      dataNascimento: DateTime.parse(_dobController.text),
      whatsapp: _whatsappController.text,
    );
    widget.onSave(updatedClient);
    Navigator.pop(context); // Retorna para a tela anterior após salvar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(labelText: 'Data de Nascimento'),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                controller: _whatsappController,
                decoration: const InputDecoration(labelText: 'WhatsApp'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
