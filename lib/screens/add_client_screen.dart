import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:intl/intl.dart';

class AddClientScreen extends StatefulWidget {
  final Function(Cliente) onAddClient;

  const AddClientScreen({super.key, required this.onAddClient});

  @override
  AddClientScreenState createState() => AddClientScreenState();
}

class AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _dobController = TextEditingController();
  final _whatsappController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _cpfFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _whatsappFocusNode = FocusNode();

  var cpfMaskFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var dobMaskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var whatsappMaskFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  void dispose() {
    _nameController.dispose();
    _cpfController.dispose();
    _dobController.dispose();
    _whatsappController.dispose();
    _nameFocusNode.dispose();
    _cpfFocusNode.dispose();
    _dobFocusNode.dispose();
    _whatsappFocusNode.dispose();
    super.dispose();
  }

  String _capitalize(String value) {
    return value.split(' ').map((str) => str.isNotEmpty ? '${str[0].toUpperCase()}${str.substring(1)}' : '').join(' ');
  }

  DateTime? _parseDate(String date) {
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(date);
    } catch (e) {
      return null;
    }
  }

  void _addClient() {
    if (_formKey.currentState!.validate()) {
      final dateOfBirth = _parseDate(_dobController.text);
      if (dateOfBirth == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data de nascimento inválida')),
        );
        return;
      }

      final cliente = Cliente(
        nome: _nameController.text,
        cpf: _cpfController.text,
        dataNascimento: dateOfBirth,
        whatsapp: _whatsappController.text,
        id: 0, // Substitua por um valor apropriado para o parâmetro id.
      );

      widget.onAddClient(cliente);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cliente adicionado com sucesso!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Cliente'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty || value.split(' ').any((word) => word.length < 3)) {
                    return 'O nome deve ter no mínimo 3 letras em cada palavra';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_cpfFocusNode);
                },
                onChanged: (value) {
                  _nameController.value = TextEditingValue(
                    text: _capitalize(value),
                    selection: _nameController.selection,
                  );
                },
              ),
              TextFormField(
                controller: _cpfController,
                focusNode: _cpfFocusNode,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [cpfMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 14) {
                    return 'CPF inválido';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dobFocusNode);
                },
              ),
              TextFormField(
                controller: _dobController,
                focusNode: _dobFocusNode,
                decoration: const InputDecoration(labelText: 'Data de Nascimento'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [dobMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Data de nascimento inválida';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_whatsappFocusNode);
                },
              ),
              TextFormField(
                controller: _whatsappController,
                focusNode: _whatsappFocusNode,
                decoration: const InputDecoration(labelText: 'WhatsApp'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [whatsappMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 15) {
                    return 'Número de WhatsApp inválido';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _addClient();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addClient,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Adicionar Cliente',
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
