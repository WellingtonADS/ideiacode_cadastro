import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  PasswordRecoveryScreenState createState() => PasswordRecoveryScreenState();
}

class PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _recoverPassword() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    try {
      await authService.sendPasswordResetEmail(_emailController.text);
      if (!mounted) return; // Verifica se o widget ainda está montado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return; // Verifica se o widget ainda está montado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send password reset email: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Recovery')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _recoverPassword,
                    child: const Text('Send Password Reset Email'),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
