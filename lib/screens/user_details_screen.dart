import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _cpfController = TextEditingController();
  String _gender = 'Masculino'; // Valor inicial padrão.
  String _photoUrl = '';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userService = UserService();
    final currentUser = authService._auth.currentUser;

    Future<void> _pickImage() async {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _photoUrl = pickedFile.path;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _birthDateController,
                decoration: InputDecoration(labelText: 'Birth Date'),
              ),
              TextField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
              ),
              SizedBox(height: 10),
              Text('Gender'),
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
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              if (_photoUrl.isNotEmpty) Image.file(File(_photoUrl)),
              SizedBox(height: 20),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User details saved')));
                },
                child: Text('Save Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
