import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ideiacode_cadastro/models/cliente.dart';
import 'package:ideiacode_cadastro/styles/app_styles.dart';

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

  var cpfMaskFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var dobMaskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var whatsappMaskFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

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
        title: const Text('Editar Cliente', style: AppStyles.titleTextStyle), // Aplicando estilo de texto do título da AppBar
        backgroundColor: AppStyles.primaryColor, // Aplicando cor de fundo da AppBar
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: AppStyles.inputLabelTextStyle, // Aplicando estilo de texto para o rótulo do campo
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty || value.split(' ').any((word) => word.length < 3)) {
                    return 'O nome deve ter no mínimo 3 letras em cada palavra';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Implementar lógica de formatação ou validação se necessário
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  labelStyle: AppStyles.inputLabelTextStyle, // Aplicando estilo de texto para o rótulo do campo
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [cpfMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 14) {
                    return 'CPF inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento',
                  labelStyle: AppStyles.inputLabelTextStyle, // Aplicando estilo de texto para o rótulo do campo
                ),
                keyboardType: TextInputType.datetime,
                inputFormatters: [dobMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Data de nascimento inválida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _whatsappController,
                decoration: const InputDecoration(
                  labelText: 'WhatsApp',
                  labelStyle: AppStyles.inputLabelTextStyle, // Aplicando estilo de texto para o rótulo do campo
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [whatsappMaskFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 15) {
                    return 'Número de WhatsApp inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.primaryColor, // Aplicando cor de fundo do botão
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: AppStyles.buttonTextStyle, // Aplicando estilo de texto para o botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
