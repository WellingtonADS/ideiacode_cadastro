import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  UserDetailsScreenState createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _cpfController = TextEditingController();
  String _gender = 'Masculino'; // Valor inicial padrão.
  String _photoUrl = '';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final userService = UserService();
    final currentUser = authService.currentUser; // Supondo que esse método retorna o usuário atual.

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (!mounted) return; // Verifica se o widget ainda está montado
        setState(() {
          _photoUrl = pickedFile.path;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _birthDateController,
                decoration: const InputDecoration(labelText: 'Birth Date'),
              ),
              TextField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
              ),
              const SizedBox(height: 10),
              const Text('Gender'),
              ListTile(
                title: const Text('Masculino'),
                leading: Radio<String>(
                  value: 'Masculino',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Feminino'),
                leading: Radio<String>(
                  value: 'Feminino',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick Image'),
              ),
              if (_photoUrl.isNotEmpty) Image.file(File(_photoUrl)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  UserModel user = UserModel(
                    id: currentUser!.uid,
                    email: currentUser.email!,
                    name: _nameController.text,
                    photoUrl: _photoUrl,
                    birthDate: _birthDateController.text,
                    cpf: _cpfController.text,
                    gender: _gender,
                  );
                  await userService.createUser(user);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User details saved')),
                    );
                  }
                },
                child: const Text('Save Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _cpfController.dispose();
    super.dispose();
  }
}
